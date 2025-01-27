<?php

namespace App\Providers;

use App\Services\DocumentAuditService;
use Illuminate\Support\ServiceProvider;

class DocumentAuditServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(DocumentAuditService::class, function($app){
            return new DocumentAuditService();
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
