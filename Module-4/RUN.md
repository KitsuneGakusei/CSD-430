# Run Instructions (Module 4 — Submit Package, NO WEB-INF)

**Folder to deploy:** `CSD-430-Module-4-SUBMIT`

Open in VS Code → Start Tomcat → Right-click server → **Add Webapp** → choose this folder → Context path `/module4`.

Then open:
```
http://localhost:8080/module4/module4.jsp
```

### What’s inside
- `module4.jsp` — Contains the assignment header **and** the JavaBean **embedded** (so no WEB-INF or compiling needed).
- `assets/styles.css` — Your stylesheet (unchanged).

### Rubric alignment
- JavaBean: **present and `Serializable`** (embedded class `Place`, 5 fields).
- Scriptlets: **used only for Java logic**; HTML outside scriptlets.
- Display: **HTML table** grouped by region.
- Additional details: **Title, overall description, field/record descriptions** included.
- Data: **Exact Module 2 records** preloaded; form allows adding rows with the bean.
