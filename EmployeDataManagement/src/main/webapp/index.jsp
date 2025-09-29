<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management</title>
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<style>

.task-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body class="bg-gray-100">

	<div id="dashboard">
		
		<!-- Main Content -->
		<div class="main-content p-4">

			<!-- Top Navigation -->
			<div
    class="bg-white rounded-lg shadow px-6 py-4 mb-6 flex justify-between items-center">
    
    <!-- Title -->
    <h1 id="page-title" class="text-xl font-bold text-gray-800">
        Employee Data Management
    </h1>

    <!-- Search Bar -->
    
    
    <div class="flex justify-end mt-6 mr-6">
  <div class="relative w-96">
    <input type="text" id="search-input"
      placeholder="Search by name..."
      class="w-full pl-10 pr-4 py-2 border rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
    <svg class="w-5 h-5 text-gray-400 absolute left-3 top-2.5" fill="none"
      stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round"
        d="M21 21l-4.35-4.35M11 19a8 8 0 100-16 8 8 0 000 16z" />
    </svg>
  </div>
</div>


 
    
</div>

			<!-- Employee List -->
			<div class="bg-white rounded-lg shadow p-6 mb-6">
				<div class="flex justify-between items-center mb-6">
					<h2 class="text-lg font-semibold text-gray-800">Employees List</h2>
					<button id="add-employee-btn"
    					class="bg-blue-600 hover:bg-blue-700 text-white font-medium px-4 py-2 rounded"> + Add
					</button>

				</div>
				<div class="overflow-x-auto">
					<table class="min-w-full divide-y divide-gray-200">
						<thead>
							<tr>
								<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
								<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
								<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">E-mail</th>
								<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Position</th>
								<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Action</th>
							</tr>
						</thead>
						<c:forEach var="e" items="${employees}">
							<tbody class="bg-white divide-y divide-gray-200">
								<tr class="hover:bg-gray-50">
									<td class="px-6 py-4 whitespace-nowrap">${e.id}</td>
									<td class="px-6 py-4 whitespace-nowrap">${e.name}</td>
									<td class="px-6 py-4 whitespace-nowrap">${e.email}</td>
									<td class="px-6 py-4 whitespace-nowrap">${e.position}</td>
									<td class="text-center">
										<div class="dropdown d-flex justify-content-center align-items-center">
											<button class="btn btn-outline-secondary btn-sm"
												type="button" data-bs-toggle="dropdown" aria-expanded="false">
												<i class="bi bi-three-dots-vertical"></i>
											</button>
											<ul class="dropdown-menu dropdown-menu-end shadow-sm">
												<li>
													<button class="dropdown-item edit-btn"
														data-bs-toggle="modal" data-bs-target="#updateModal"
														data-id="${e.id}" data-name="${e.name}"
														data-email="${e.email}" data-position="${e.position}">
														<i class="bi bi-pencil-square text-primary"></i> Edit
													</button>
												</li>
												<li>
													<button class="dropdown-item text-danger delete-btn"
														data-bs-toggle="modal" data-bs-target="#deleteModal"
														data-id="${e.id}">
														<i class="bi bi-trash3"></i> Delete
													</button>
												</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Employee Modal -->
	
	
	
	<!-- Add Employee Modal -->
<div id="add-employee-modal"
	class="fixed inset-0 bg-gray-600 bg-opacity-50 flex items-center justify-center hidden z-50">
	<div class="bg-white rounded-lg shadow-xl max-w-md w-full p-6">
		<div class="flex justify-between items-center mb-4">
			<h3 class="text-lg font-semibold text-gray-800">Add New Employee</h3>
			<button id="close-employee-modal" class="text-gray-500 hover:text-gray-700">
				<i class="fas fa-times"></i>
			</button>
		</div>

		<form id="employee-form" action="req1" method="post" novalidate>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<div class="space-y-4">
				<!-- Full Name -->
				<div>
					<label for="employee-name" class="block text-sm font-medium text-gray-700">Full Name</label>
					<input type="text" id="employee-name" name="name"
						class="mt-1 block w-full px-3 py-2 border rounded-md">
					<p id="name-error" class="text-red-500 text-sm mt-1 hidden">Full name is required (min 3 letters).</p>
				</div>

				<!-- Email -->
				<div>
					<label for="employee-email" class="block text-sm font-medium text-gray-700">Email</label>
					<input type="email" id="employee-email" name="email"
						class="mt-1 block w-full px-3 py-2 border rounded-md">
					<p id="email-error" class="text-red-500 text-sm mt-1 hidden">Enter a valid email address.</p>
				</div>

				<!-- Position -->
				<div>
					<label for="employee-position" class="block text-sm font-medium text-gray-700">Position</label>
					<input type="text" id="employee-position" name="position"
						class="mt-1 block w-full px-3 py-2 border rounded-md">
					<p id="position-error" class="text-red-500 text-sm mt-1 hidden">Position is required.</p>
				</div>
			</div>

			<!-- Buttons -->
			<div class="mt-6 flex justify-end space-x-3">
				<button type="button" id="cancel-employee"
					class="px-4 py-2 bg-gray-200 rounded-md">Cancel</button>
				<button type="submit" name="b1" value="add"
					class="px-4 py-2 bg-indigo-600 text-white rounded-md">Save</button>
			</div>
		</form>
	</div>
</div>


	<!-- Edit Employee Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="req1" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="modal-header">
						<h5 class="modal-title">Edit Employee</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id" id="edit-id">

						<div class="mb-3">
							<label for="edit-name" class="form-label">Name</label>
							<input type="text" class="form-control" id="edit-name" name="name">
						</div>
						<div class="mb-3">
							<label for="edit-email" class="form-label">Email</label>
							<input type="email" class="form-control" id="edit-email" name="email">
						</div>
						<div class="mb-3">
							<label for="edit-position" class="form-label">Position</label>
							<input type="text" class="form-control" id="edit-position" name="position">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" name="b1" value="Update" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Delete Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="req1" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="modal-header">
						<h5 class="modal-title">Delete Confirmation</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						Are you sure you want to delete this employee?
						<input type="hidden" name="id" id="delete-id">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" name="b1" value="delete" class="btn btn-danger">Delete</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<script>
    const addEmployeeBtn = document.getElementById('add-employee-btn');
    const closeEmployeeModal = document.getElementById('close-employee-modal');
    const cancelEmployee = document.getElementById('cancel-employee');
    const modal = document.getElementById('add-employee-modal');

    addEmployeeBtn?.addEventListener('click', () => modal.classList.remove('hidden'));
    closeEmployeeModal?.addEventListener('click', () => modal.classList.add('hidden'));
    cancelEmployee?.addEventListener('click', () => modal.classList.add('hidden'));
    
    document.addEventListener("DOMContentLoaded", function () {
        // Fill Edit Modal
        document.querySelectorAll(".edit-btn").forEach(button => {
          button.addEventListener("click", function () {
            document.getElementById("edit-id").value = this.dataset.id;
            document.getElementById("edit-name").value = this.dataset.name;
            document.getElementById("edit-email").value = this.dataset.email;
            document.getElementById("edit-position").value = this.dataset.position;
          });
        });

        // Fill Delete Modal
        document.querySelectorAll(".delete-btn").forEach(button => {
          button.addEventListener("click", function () {
            document.getElementById("delete-id").value = this.dataset.id;
          });
        });
      });
    
    
   
    document.getElementById("employee-form").addEventListener("submit", function(e) {
    	let isValid = true;

    	// Name Validation
    	const nameInput = document.getElementById("employee-name");
    	const nameError = document.getElementById("name-error");
    	if (!nameInput.value.trim() || nameInput.value.trim().length < 3) {
    		nameError.classList.remove("hidden");
    		isValid = false;
    	} else {
    		nameError.classList.add("hidden");
    	}

    	// Email Validation
    	const emailInput = document.getElementById("employee-email");
    	const emailError = document.getElementById("email-error");
    	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    	if (!emailPattern.test(emailInput.value.trim())) {
    		emailError.classList.remove("hidden");
    		isValid = false;
    	} else {
    		emailError.classList.add("hidden");
    	}

    	// Position Validation
    	const positionInput = document.getElementById("employee-position");
    	const positionError = document.getElementById("position-error");
    	if (!positionInput.value.trim()) {
    		positionError.classList.remove("hidden");
    		isValid = false;
    	} else {
    		positionError.classList.add("hidden");
    	}

    	// Stop form submission if invalid
    	if (!isValid) {
    		e.preventDefault();
    	}
    });
    
    
    
    
    
    
    
    
    
</script>
</body>
</html>
