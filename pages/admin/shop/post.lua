function post()
    if not app.Shop.Enabled then
        http:redirect("/")
        return
    end

    if not session:isAdmin() then
        http:redirect("/")
        return
    end

    if db:query("SELECT 1 FROM castro_shop_categories WHERE id = ?", http.postValues.id) == nil then
        http:redirect("/")
        return
    end

    db:execute("DELETE FROM castro_shop_categories WHERE id = ?", http.postValues.id)
    session:setFlash("success", "Category removed")
    http:redirect("/subtopic/admin/shop")
end