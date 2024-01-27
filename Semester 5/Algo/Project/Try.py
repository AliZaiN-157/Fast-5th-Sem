# import time
# import numpy as np
# import matplotlib.pyplot as plt
# from matplotlib.animation import FuncAnimation
# from matplotlib.widgets import Button

# print("\n------------------------------------------------------------------------------------")
# print("           Incremental (Jarvis March) algorithm in 2D, with live plotting            ")
# print("------------------------------------------------------------------------------------\n")

# # Define a global variable to store the previous hull
# prev_hull = np.empty((0, 2))

# # Variable that stores the total time that we pause the plot animation
# overall_stop_time = 0

# # Function to sort a list of points lexicographically based on their x and y coordinates


# def lexicographic_sort(points):
#     points = np.array(points)
#     print("\n-------------------------Initial 2D points-------------------------\n")
#     print(points)

#     sorted_indices = np.lexsort((points[:, 1], points[:, 0]))
#     sorted_points = points[sorted_indices]

#     leftmost_point = min(sorted_points, key=lambda point: (point[0], point[1]))
#     leftmost_index = np.where((sorted_points[:, 0] == leftmost_point[0]) & (
#         sorted_points[:, 1] == leftmost_point[1]))[0][0]

#     sorted_points = np.roll(sorted_points, -leftmost_index, axis=0)

#     N = len(sorted_points)
#     labels = np.arange(1, N + 1)
#     print("\n-------------------------Sorted 2D points-------------------------\n")
#     print(sorted_points)
#     return sorted_points

# # Disorder function for collinear points -> modifies the coordinates of the 3 points


# def apply_disorder(points, epsilon):
#     displacement = (np.random.rand(2) - 0.5) * epsilon
#     points += displacement

# # Function to execute if we find 3 collinear points


# def collinear_points(points):
#     epsilon = 1e-6
#     points = apply_disorder(points, epsilon)

# # Function to determine the orientation of three points


# def orientation(p, q, r):
#     val = (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1])
#     if val == 0:
#         collinear_points([p, q, r])
#         orientation(p, q, r)
#     elif val > 0:
#         return 1  # 1 if points are CCW
#     else:
#         return -1  # -1 if points are CW

# # Function to compute the convex hull of a set of points using Jarvis March (Incremental) algorithm


# def jarvis_march(points):
#     if len(points) < 3:
#         return []

#     # Find the leftmost point
#     leftmost_point = min(points, key=lambda point: point[0])

#     # Start at the leftmost point and go counterclockwise
#     current_point = leftmost_point
#     convex_hull = []
#     while True:
#         convex_hull.append(current_point)

#         # Find the next point in the hull
#         next_point = None
#         for point in points:
#             if (point == current_point).all():
#                 continue
#             if next_point is None:
#                 next_point = point
#             else:
#                 cross_product = (point[0] - current_point[0]) * (next_point[1] - current_point[1]) - \
#                                 (point[1] - current_point[1]) * \
#                     (next_point[0] - current_point[0])
#                 if cross_product < 0:
#                     next_point = point
#                 elif cross_product == 0:
#                     dist_next = (
#                         next_point[0] - current_point[0]) ** 2 + (next_point[1] - current_point[1]) ** 2
#                     dist_point = (point[0] - current_point[0]
#                                   ) ** 2 + (point[1] - current_point[1]) ** 2
#                     if dist_point > dist_next:
#                         next_point = point
#         if (next_point == leftmost_point).all():
#             break
#         current_point = next_point

#     return np.array(convex_hull)


# # Generate X random points from user input
# current_time = int(time.time())
# np.random.seed(current_time)
# num_of_points = int(
#     input("How many points do you want to examine as per their Convex Hull? -> "))
# points = np.random.rand(num_of_points, 2)
# start_time = time.time()
# points = lexicographic_sort(points)

# # Set up the figure and axis for animation
# fig, ax = plt.subplots()
# ax.set_title("Jarvis March Algorithm for Convex Hull")
# ax.set_xlabel("X")
# ax.set_ylabel("Y")

# # Plot the initial points
# scatter = ax.scatter(points[:, 0], points[:, 1], c="b", marker="o")
# for i in range(num_of_points):
#     ax.text(points[i, 0], points[i, 1], str(i + 1), fontsize=12)

# # Initialize an empty line for the convex hull edges
# line, = ax.plot([], [], "r-")

# # Update function for animation


# def update(i):
#     global overall_stop_time
#     global prev_hull
#     plot_time_start = time.time()
#     hull = np.array(jarvis_march(points[:i + 2]))
#     if len(hull) > 0:
#         line.set_data(np.append(hull[:, 0], hull[0, 0]),
#                       np.append(hull[:, 1], hull[0, 1]))
#         if np.array_equal(hull, prev_hull):
#             ani.event_source.stop()
#         else:
#             prev_hull = hull.copy()
#     if i == num_of_points - 1:
#         finish_time = time.time()
#         print(
#             '\n-------------------------Convex Hull Points-------------------------\n', hull)
#         print("\nElapsed calculation time: ", finish_time -
#               start_time - overall_stop_time, "seconds")
#     plot_time_end = time.time()
#     return [scatter, line]


# # Create the animation
# ani = FuncAnimation(fig, update, frames=len(points), interval=500, blit=True)

# # Pause/Resume Button
# axpause = plt.axes([0.7, 0.05, 0.1, 0.075])
# btn_pause = Button(axpause, 'Pause', color='lightgrey', hovercolor='lightblue')

# # Boolean variable to keep track of animation status
# is_animation_running = True

# # Function to pause/unpause the animation


# def pause_animation(event):
#     global stop_time_begin
#     global is_animation_running
#     if is_animation_running:
#         ani.event_source.stop()
#         stop_time_begin = time.time()
#         btn_pause.color = 'lightblue'
#     else:
#         global stop_time_end
#         global overall_stop_time
#         ani.event_source.start()
#         stop_time_end = time.time()
#         overall_stop_time = overall_stop_time + stop_time_end - stop_time_begin
#         btn_pause.color = 'lightgrey'
#     is_animation_running = not is_animation_running


# btn_pause.on_clicked(pause_animation)

# plt.show()

# import time
# import numpy as np
# import matplotlib.pyplot as plt
# from matplotlib.animation import FuncAnimation
# from matplotlib.widgets import Button

# print("\n------------------------------------------------------------------------------------")
# print("           Brute Force algorithm in 2D, with live plotting            ")
# print("------------------------------------------------------------------------------------\n")

# # Define a global variable to store the previous hull
# prev_hull = np.empty((0, 2))

# # Variable that stores the total time that we pause the plot animation
# overall_stop_time = 0

# # Function to sort a list of points lexicographically based on their x and y coordinates


# def lexicographic_sort(points):
#     points = np.array(points)
#     print("\n-------------------------Initial 2D points-------------------------\n")
#     print(points)

#     sorted_indices = np.lexsort((points[:, 1], points[:, 0]))
#     sorted_points = points[sorted_indices]

#     leftmost_point = min(sorted_points, key=lambda point: (point[0], point[1]))
#     leftmost_index = np.where((sorted_points[:, 0] == leftmost_point[0]) & (
#         sorted_points[:, 1] == leftmost_point[1]))[0][0]

#     sorted_points = np.roll(sorted_points, -leftmost_index, axis=0)

#     N = len(sorted_points)
#     labels = np.arange(1, N + 1)
#     print("\n-------------------------Sorted 2D points-------------------------\n")
#     print(sorted_points)
#     return sorted_points

# # Disorder function for collinear points -> modifies the coordinates of the 3 points


# def apply_disorder(points, epsilon):
#     displacement = (np.random.rand(2) - 0.5) * epsilon
#     points += displacement

# # Function to execute if we find 3 collinear points


# def collinear_points(points):
#     epsilon = 1e-6
#     points = apply_disorder(points, epsilon)

# # Function to determine the orientation of three points


# def orientation(p, q, r):
#     val = (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1])
#     if val == 0:
#         collinear_points([p, q, r])
#         orientation(p, q, r)
#     elif val > 0:
#         return 1  # 1 if points are CCW
#     else:
#         return -1  # -1 if points are CW

# # Function to compute the convex hull of a set of points using the Brute Force algorithm


# def brute_force(points):
#     n = len(points)
#     if n < 3:
#         return points

#     hull = []
#     for i in range(n):
#         for j in range(i+1, n):
#             valid = True
#             for k in range(n):
#                 if k != i and k != j:
#                     if orientation(points[i], points[j], points[k]) != 1:
#                         valid = False
#                         break
#             if valid:
#                 hull.append(points[i])
#                 hull.append(points[j])
#     return np.array(hull)


# # Generate X random points from user input
# current_time = int(time.time())
# np.random.seed(current_time)
# num_of_points = int(
#     input("How many points do you want to examine as per their Convex Hull? -> "))
# points = np.random.rand(num_of_points, 2)
# start_time = time.time()
# points = lexicographic_sort(points)

# # Set up the figure and axis for animation
# fig, ax = plt.subplots()
# ax.set_title("Brute Force Algorithm for Convex Hull")
# ax.set_xlabel("X")
# ax.set_ylabel("Y")

# # Plot the initial points
# scatter = ax.scatter(points[:, 0], points[:, 1], c="b", marker="o")
# for i in range(num_of_points):
#     ax.text(points[i, 0], points[i, 1], str(i + 1), fontsize=12)

# # Initialize an empty line for the convex hull edges
# line, = ax.plot([], [], "r-")

# # Update function for animation


# def update(i):
#     global overall_stop_time
#     global prev_hull
#     plot_time_start = time.time()
#     hull = np.array(brute_force(points[:i + 2]))
#     if len(hull) > 0:
#         line.set_data(np.append(hull[:, 0], hull[0, 0]),
#                       np.append(hull[:, 1], hull[0, 1]))
#         if np.array_equal(hull, prev_hull):
#             ani.event_source.stop()
#         else:
#             prev_hull = hull.copy()
#     if i == num_of_points - 1:
#         finish_time = time.time()
#         print(
#             '\n-------------------------Convex Hull Points-------------------------\n', hull)
#         print("\nElapsed calculation time: ", finish_time -
#               start_time - overall_stop_time, "seconds")
#     plot_time_end = time.time()
#     return [scatter, line]


# # Create the animation
# ani = FuncAnimation(fig, update, frames=len(points), interval=500, blit=True)

# # Pause/Resume Button
# axpause = plt.axes([0.7, 0.05, 0.1, 0.075])
# btn_pause = Button(axpause, 'Pause', color='lightgrey', hovercolor='lightblue')

# # Boolean variable to keep track of animation status
# is_animation_running = True

# # Function to pause/unpause the animation


# def pause_animation(event):
#     global stop_time_begin
#     global is_animation_running
#     if is_animation_running:
#         ani.event_source.stop()
#         stop_time_begin = time.time()
#         btn_pause.color = 'lightblue'
#     else:
#         global stop_time_end
#         global overall_stop_time
#         ani.event_source.start()
#         stop_time_end = time.time()
#         overall_stop_time = overall_stop_time + stop_time_end - stop_time_begin
#         btn_pause.color = 'lightgrey'
#     is_animation_running = not is_animation_running


# btn_pause.on_clicked(pause_animation)

# plt.show()

import time
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib.widgets import Button

print("\n------------------------------------------------------------------------------------")
print("           Quickhull algorithm in 2D, with live plotting            ")
print("------------------------------------------------------------------------------------\n")

# Define a global variable to store the previous hull
prev_hull = np.empty((0, 2))

# Variable that stores the total time that we pause the plot animation
overall_stop_time = 0

# Function to sort a list of points lexicographically based on their x and y coordinates


def lexicographic_sort(points):
    points = np.array(points)
    print("\n-------------------------Initial 2D points-------------------------\n")
    print(points)

    sorted_indices = np.lexsort((points[:, 1], points[:, 0]))
    sorted_points = points[sorted_indices]

    leftmost_point = min(sorted_points, key=lambda point: (point[0], point[1]))
    leftmost_index = np.where((sorted_points[:, 0] == leftmost_point[0]) & (
        sorted_points[:, 1] == leftmost_point[1]))[0][0]

    sorted_points = np.roll(sorted_points, -leftmost_index, axis=0)

    N = len(sorted_points)
    labels = np.arange(1, N + 1)
    print("\n-------------------------Sorted 2D points-------------------------\n")
    print(sorted_points)
    return sorted_points

# Disorder function for collinear points -> modifies the coordinates of the 3 points


def apply_disorder(points, epsilon):
    displacement = (np.random.rand(2) - 0.5) * epsilon
    points += displacement

# Function to execute if we find 3 collinear points


def collinear_points(points):
    epsilon = 1e-6
    points = apply_disorder(points, epsilon)

# Function to determine the orientation of three points


def orientation(p, q, r):
    val = (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1])
    if val == 0:
        collinear_points([p, q, r])
        orientation(p, q, r)
    elif val > 0:
        return 1  # 1 if points are CCW
    else:
        return -1  # -1 if points are CW

# Function to compute the convex hull of a set of points using the Quickhull algorithm


def quickhull(points):
    def find_hull(points, left, right):
        hull = []

        for point in points:
            if orientation(left, right, point) == 1:
                hull.append(point)

        if not hull:
            return [right]

        pivot = min(hull, key=lambda p: np.linalg.norm(
            np.cross(p - left, right - left)) / np.linalg.norm(right - left))
        hull1 = find_hull(hull, left, pivot)
        hull2 = find_hull(hull, pivot, right)

        return hull1 + hull2

    if len(points) < 3:
        return points

    leftmost_point = min(points, key=lambda point: point[0])
    rightmost_point = max(points, key=lambda point: point[0])

    upper_hull = find_hull(points, leftmost_point, rightmost_point)
    lower_hull = find_hull(points, rightmost_point, leftmost_point)

    return np.array(upper_hull + lower_hull)


# Generate X random points from user input
current_time = int(time.time())
np.random.seed(current_time)
num_of_points = int(
    input("How many points do you want to examine as per their Convex Hull? -> "))
points = np.random.rand(num_of_points, 2)
start_time = time.time()
points = lexicographic_sort(points)

# Set up the figure and axis for animation
fig, ax = plt.subplots()
ax.set_title("Quickhull Algorithm for Convex Hull")
ax.set_xlabel("X")
ax.set_ylabel("Y")

# Plot the initial points
scatter = ax.scatter(points[:, 0], points[:, 1], c="b", marker="o")
for i in range(num_of_points):
    ax.text(points[i, 0], points[i, 1], str(i + 1), fontsize=12)

# Initialize an empty line for the convex hull edges
line, = ax.plot([], [], "r-")

# Update function for animation


def update(i):
    global overall_stop_time
    global prev_hull
    plot_time_start = time.time()
    hull = np.array(quickhull(points[:i + 2]))
    if len(hull) > 0:
        line.set_data(np.append(hull[:, 0], hull[0, 0]),
                      np.append(hull[:, 1], hull[0, 1]))
        if np.array_equal(hull, prev_hull):
            ani.event_source.stop()
        else:
            prev_hull = hull.copy()
    if i == num_of_points - 1:
        finish_time = time.time()
        print(
            '\n-------------------------Convex Hull Points-------------------------\n', hull)
        print("\nElapsed calculation time: ", finish_time -
              start_time - overall_stop_time, "seconds")
    plot_time_end = time.time()
    return [scatter, line]


# Create the animation
ani = FuncAnimation(fig, update, frames=len(points), interval=500, blit=True)

# Pause/Resume Button
axpause = plt.axes([0.7, 0.05, 0.1, 0.075])
btn_pause = Button(axpause, 'Pause', color='lightgrey', hovercolor='lightblue')

# Boolean variable to keep track of animation status
is_animation_running = True

# Function to pause/unpause the animation


def pause_animation(event):
    global stop_time_begin
    global is_animation_running
    if is_animation_running:
        ani.event_source.stop()
        stop_time_begin = time.time()
        btn_pause.color = 'lightblue'
    else:
        global stop_time_end
        global overall_stop_time
        ani.event_source.start()
        stop_time_end = time.time()
        overall_stop_time = overall_stop_time + stop_time_end - stop_time_begin
        btn_pause.color = 'lightgrey'
    is_animation_running = not is_animation_running


btn_pause.on_clicked(pause_animation)

plt.show()
