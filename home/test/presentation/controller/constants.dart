import 'package:entities/shows/entities/schedule.dart';
import 'package:entities/shows/entities/show.dart';

const show = Show(
  id: 1,
  url: 'https://www.tvmaze.com/shows/1/under-the-dome',
  name: 'Under the Dome',
  imageUrl:
      'https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg',
  summary:
      '<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The towns inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',
  schedule: Schedule(
    time: '22:00',
    days: [
      'Thursday',
    ],
  ),
  genres: [
    'Drama',
    'Science-Fiction',
    'Thriller',
  ],
  status: 'Ended',
  type: 'Scripted',
);

const showsExpected = [
  Show(
    id: 1,
    url: 'https://www.tvmaze.com/shows/1/under-the-dome',
    name: 'Under the Dome',
    imageUrl:
        'https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg',
    summary:
        '<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The towns inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',
    schedule: Schedule(
      time: '22:00',
      days: [
        'Thursday',
      ],
    ),
    genres: [
      'Drama',
      'Science-Fiction',
      'Thriller',
    ],
    status: 'Ended',
    type: 'Scripted',
  ),
];

const showsListExpected = [
  [
    show,
    show,
    show,
    show,
    show,
    show,
    show,
    show,
    show,
    show,
  ]
];
