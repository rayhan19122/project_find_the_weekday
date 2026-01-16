# 📅 Doomsday Algorithm: Day of Week Calculator

## 🎯 Goal

Given a date in `DD/MM/YYYY` format, find the weekday (`Sunday … Saturday`) using pure mathematical calculations.

**Features:**
- ✅ Works for any century
- ✅ Handles leap & non-leap years correctly
- ✅ Pure algorithmic approach (no DateTime libraries)

---

## 📖 Table of Contents

1. [What is the Doomsday Method?](#what-is-the-doomsday-method)
2. [Weekday Encoding](#weekday-encoding)
3. [Leap Year Algorithm](#leap-year-algorithm)
4. [Complete Algorithm Steps](#complete-algorithm-steps)
5. [Pseudocode](#pseudocode)
6. [Summary of Key Terms](#summary-of-key-terms)

---

## 1️⃣ What is the Doomsday Method?

**Doomsday** = One fixed weekday for a year.

In any given year, certain special dates (called "doomsday dates") always fall on the same weekday.

### Example:
If the Doomsday of **2026** is **Saturday**, then:
- 4/4 (April 4) = Saturday
- 6/6 (June 6) = Saturday
- 8/8 (August 8) = Saturday
- 10/10 (October 10) = Saturday
- 12/12 (December 12) = Saturday
- 3/14 (Pi Day, March 14) = Saturday
- 5/9 (May 9) = Saturday
- 9/5 (September 5) = Saturday

**Key Insight:** Once we compute the year's Doomsday, any other date can be found by counting the difference from a nearby anchor date.

---

## 2️⃣ Weekday Encoding

We represent weekdays as numbers (0-6):

| Value | Weekday   |
|-------|-----------|
| 0     | Sunday    |
| 1     | Monday    |
| 2     | Tuesday   |
| 3     | Wednesday |
| 4     | Thursday  |
| 5     | Friday    |
| 6     | Saturday  |

---

## 3️⃣ Leap Year Algorithm

Leap years affect only **January** and **February** anchor dates.

### Leap Year Definition (Gregorian Calendar):

A year is a **leap year** if:
- ✅ Divisible by 400, **OR**
- ✅ Divisible by 4 **AND** NOT divisible by 100

### Examples:
- 2000 → Leap (divisible by 400)
- 1900 → Not leap (divisible by 100, not by 400)
- 2024 → Leap (divisible by 4, not by 100)
- 2026 → Not leap

---

## 4️⃣ Complete Algorithm Steps

### Input Parameters:
- `day` = DD (day of month)
- `month` = MM (month number, 1-12)
- `year` = YYYY (full year)

---

### ✅ **Step A: Compute Century Anchor**

**What is Century Anchor?**  
Every century has a fixed weekday called the **anchor weekday**. This is the Doomsday for the first year of that century (year 00).

**Example:**
- 1900s anchor = Wednesday
- 2000s anchor = Tuesday

**Formula:**

```
century = floor(year / 100)
anchor = (5 * (century % 4) + 2) % 7
```

**Output:** `anchor` is a weekday index (0-6)

---

### ✅ **Step B: Compute Year Doomsday**

**What is Year Doomsday?**  
This gives the weekday index for the "doomsday dates" in that specific year.

**Variables:**
```
y = year % 100  (last 2 digits)
a = floor(y / 12)
b = y % 12
c = floor(b / 4)
```

**Formula:**
```
doomsday = (anchor + a + b + c) % 7
```

**Why this works?**  
It counts:
- How many full 12-year cycles have passed
- Remaining years after those cycles
- Number of leap years in the remaining years

---

### ✅ **Step C: Month Anchor Date (Doomsday Date)**

For each month, there is a special "anchor day-of-month" that always falls on the Doomsday weekday.

**Non-leap Year Doomsday Dates:**

| Month | Anchor Day |
|-------|------------|
| Jan   | 3          |
| Feb   | 28         |
| Mar   | 14         |
| Apr   | 4          |
| May   | 9          |
| Jun   | 6          |
| Jul   | 11         |
| Aug   | 8          |
| Sep   | 5          |
| Oct   | 10         |
| Nov   | 7          |
| Dec   | 12         |

**⚠️ Leap Year Correction:**
- January: 4 (instead of 3)
- February: 29 (instead of 28)

---

### ✅ **Step D: Calculate Final Weekday**

Now we know:
- `doomsday` = weekday of the anchor
- `referenceDay` = the month's doomsday date (like Jan 3/4)

**Formula:**
```
diff = day - referenceDay
weekdayIndex = (doomsday + diff) % 7
```

**Handle negative values:**
```
if weekdayIndex < 0:
    weekdayIndex = weekdayIndex + 7
```

**Final result:**
```
weekday = weekdays[weekdayIndex]
```

---

## 5️⃣ Pseudocode

```plaintext
function weekdayFromDate(day, month, year):

    weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"]

    # Step 1: Determine leap year and set Jan/Feb anchors
    if isLeapYear(year):
        janAnchor = 4
        febAnchor = 29
    else:
        janAnchor = 3
        febAnchor = 28

    # Step 2: Month anchor dates (index 0 unused, 1-12 for Jan-Dec)
    monthAnchor = [
        0,
        janAnchor, febAnchor, 14, 4, 9, 6, 11, 8, 5, 10, 7, 12
    ]

    # Step 3: Calculate century anchor
    century = floor(year / 100)
    anchor = (5 * (century % 4) + 2) % 7

    # Step 4: Calculate year doomsday
    y = year % 100
    a = floor(y / 12)
    b = y % 12
    c = floor(b / 4)
    doomsday = (anchor + a + b + c) % 7

    # Step 5: Calculate weekday from doomsday
    referenceDay = monthAnchor[month]
    diff = day - referenceDay
    weekdayIndex = (doomsday + diff) % 7
    
    if weekdayIndex < 0:
        weekdayIndex = weekdayIndex + 7

    return weekdays[weekdayIndex]


function isLeapYear(year):
    if year % 400 == 0:
        return true
    if year % 100 == 0:
        return false
    if year % 4 == 0:
        return true
    return false
```

---

## 6️⃣ Summary of Key Terms

| Term | Definition |
|------|------------|
| **Century Anchor** | Fixed weekday for each century (e.g., 2000s → Tuesday). This is the Doomsday for year 00 of that century. |
| **Doomsday** | Fixed weekday for each specific year, computed using the century anchor plus year adjustments. |
| **Month Anchor Date** | The day-of-month in each month that falls on the Doomsday (e.g., 4/4, 6/6, 8/8, 12/12). |
| **diff** | Difference between the input day and the month's anchor date. |
| **weekdayIndex** | Final weekday number (0-6) representing Sunday through Saturday. |
| **Leap Year** | Year with 366 days; affects January (anchor = 4) and February (anchor = 29). |

---

## 🎓 How It Works: Visual Example

Let's find the weekday for **January 16, 2026**:

1. **Century Anchor**: 2026 → century = 20 → anchor = (5×0+2)%7 = **2** (Tuesday)
2. **Year Doomsday**: y=26, a=2, b=2, c=0 → doomsday = (2+2+2+0)%7 = **6** (Saturday)
3. **Month Anchor**: January 2026 (non-leap) → anchor = **3**
4. **Calculate**: diff = 16-3 = 13 → (6+13)%7 = 19%7 = **5** (Friday)

**Result: January 16, 2026 is Friday ✅**

---

## 📚 References

- [Doomsday Algorithm - Wikipedia](https://en.wikipedia.org/wiki/Doomsday_rule)
- John Conway's Mental Calendar Algorithm
- Gregorian Calendar Rules

---

## 📝 License

This algorithm is in the public domain. Feel free to use, modify, and distribute.

---

## 🤝 Contributing

Found a bug or want to improve the explanation? Feel free to submit issues or pull requests!

---

**Happy Date Calculating! 📅✨**