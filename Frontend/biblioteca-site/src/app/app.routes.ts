import { BookDetails } from './book-details/book-details';
import { Routes } from '@angular/router';
import path from 'node:path';
import { App } from './app';

export const routes: Routes = [
  {path: '', component: App},
  { path: 'book-details', component: BookDetails },
];
