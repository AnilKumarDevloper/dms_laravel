<?php

namespace App\Providers;

use App\Models\backend\Notification;
use App\Models\backend\SubFolder;
use App\Models\backend\UserFolderPermission;
use App\Models\backend\UserMainFolderPermission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;
use App\Models\backend\{DepartmentType, MainFolder};
use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void{
        
    //     View::composer('*', function ($view) {
    //         $departments = SubFolder::get();
    //         $main_folders = MainFolder::with('getSubFolder')->orderBy('name')->get();
            
    //         $view->with([
    //             'departments' => $departments, 
    //             'main_folders' => $main_folders
    //         ]);
    // });
}
}
