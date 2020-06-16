import 'package:flutter/material.dart';
import 'package:frest/models/repos_model.dart';
import 'package:frest/models/token_model.dart';
import 'package:frest/utils/margin.dart';
import 'package:frest/widgets/loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:frest/utils/theme.dart';
import 'package:frest/view_models/home_vm.dart';

class HomePage extends StatefulWidget {
  final TokenModel tokenModel;
  const HomePage(this.tokenModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    var tempProvider = context.read<HomeViewModel>();
    tempProvider.getRepos(context, widget?.tokenModel?.accessToken);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Scaffold(
      backgroundColor: bgColor,
      body: !provider.isLoading
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal:30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const YMargin(70),
                  Text('Your Repos',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: white,
                          fontSize: 23,
                        ),
                      )),
                  const YMargin(20),
                  Flexible(
                    child: ListView(
                      padding: EdgeInsets.all(0),
                      children: [
                        const YMargin(30),
                        if (provider.reposModel != null &&
                            provider.reposModel.data.length > 0)
                          for (var item in provider.reposModel.data)
                            RepoWidget(item)
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Loader(),
    );
  }
}

class RepoWidget extends StatelessWidget {
  const RepoWidget(
    this.repoItem,
  );

  final ReposModel repoItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth(0.8),
      
      padding: EdgeInsets.only(
        left: 30,
        top: 30,
        right: 15,
        bottom: 20,
      ),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
          color: darkGrey, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            repoItem?.name ?? '',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: white,
                fontSize: 19,
              ),
            ),
          ),
          const YMargin(7),
          Text(
            repoItem?.htmlUrl ?? '',
            style: GoogleFonts.sourceCodePro(
              textStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ),
          const YMargin(20),
          Text(
            repoItem?.description ?? '',
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: white,
                fontSize: 14,
              ),
            ),
          ),
          const YMargin(30),
          Row(
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    color: red,
                    child: Text(
                      repoItem?.language ?? '',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const XMargin(20),
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    color: primary,
                    child: Text(
                      repoItem?.license?.name ?? '',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
