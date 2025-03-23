// Fetch Event Data (Simulated with Dummy Data)
let events = [
    { id: 1, name: "Tech Conference", date: "2025-05-20", time: "10:00 AM", location: "New York" },
    { id: 2, name: "AI Summit", date: "2025-06-10", time: "12:00 PM", location: "Los Angeles" },
];

// Display Event Cards
function displayEventCards() {
    const eventCards = document.getElementById("eventCards");
    if (eventCards) {
        eventCards.innerHTML = "";
        events.forEach((event) => {
            eventCards.innerHTML += `
                <div class="event-card" onclick="redirectToEvent(${event.id})">
                    <h3>${event.name}</h3>
                    <p>${event.date} | ${event.time}</p>
                    <p>${event.location}</p>
                </div>
            `;
        });
    }
}

// Redirect to Event Page
function redirectToEvent(eventId) {
    window.location.href = `event.html?eventId=${eventId}`;
}

// Load Cards on Page Load
document.addEventListener("DOMContentLoaded", displayEventCards);
