using Microsoft.EntityFrameworkCore;
using WebApplication15.Models;
using Oracle.EntityFrameworkCore.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();


// Add services
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseOracle(builder.Configuration.GetConnectionString("Oracle")!,
        o => o.UseOracleSQLCompatibility(OracleSQLCompatibility.DatabaseVersion21))); // Important for EF Core compatibility

// Configure/Register DbContext class for  Oracle EF Core
// builder.Services.AddDbContext<AppDbContext>(options => options.UseOracle(connectionString));

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowReactApp",
        policy =>
        {
            policy.WithOrigins("http://localhost:5173")
                  .AllowAnyHeader()
                  .AllowAnyMethod();
        });
});


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}



using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();

    for (int i = 0; i < 60; i++)
    {
        try
        {
            db.Database.Migrate();               // creates DB + applies all migrations
            app.Logger.LogInformation("Database migrated successfully!");
            break;
        }
        catch (Exception ex)
        {
            if (i == 59) throw;
            app.Logger.LogWarning(ex, "Waiting for Oracle... retry {0}/60", i + 1);
            await Task.Delay(5000);
        }
    }
};

app.UseCors("AllowReactApp");

app.UseHttpsRedirection();

app.UseAuthorization();


app.MapControllers();

app.Run();