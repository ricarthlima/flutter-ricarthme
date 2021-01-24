import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/pages/professional_views/service_item.dart';

class PServicesView extends StatefulWidget {
  @override
  _PServicesViewState createState() => _PServicesViewState();
}

class _PServicesViewState extends State<PServicesView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: getHeight(context),
      padding: EdgeInsets.symmetric(
        horizontal: (getWidth(context) > 700) ? 75 : 10,
        vertical: 75,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Wrap(
                spacing: 15,
                runSpacing: 15,
                direction: Axis.horizontal,
                children: [
                  ServiceItem(
                    color: 0,
                    image: "icon_smartphone.png",
                    title: "Desenvolvedor de Aplicativos",
                    text:
                        "Desenvolvimento de aplicativos e PWA para celulares Android e iOS com o Framework Flutter.",
                  ),
                  ServiceItem(
                    color: 0,
                    image: "icon_android.png",
                    title: "Android com Kotlin",
                    text:
                        "Desenvolvimento de Apps Nativos para Android com Kotlin.",
                  ),
                  ServiceItem(
                    color: 0,
                    image: "icon_web.png",
                    title: "Criação de Sites",
                    text:
                        "Desenvolvimento de sites com HTML, CSS, JavaScript e Bootstrap.",
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                direction: Axis.horizontal,
                children: [
                  ServiceItem(
                    color: 1,
                    image: "icon_blueprint.png",
                    title: "Ideação e Prototipação",
                    text:
                        "Experiência com as etapas iniciais de desenvolvimento de software, como a criação de protótipos.",
                  ),
                  ServiceItem(
                    color: 1,
                    image: "icon_photoshop.png",
                    title: "Photoshop e Design",
                    text:
                        "Tenho mais de 10 anos de experiência com edição de imagem usando o Adobe Photoshop. Posso criar todo tipo de peça comercial usando a ferramenta.",
                  ),
                  ServiceItem(
                    color: 1,
                    image: "icon_teacher.png",
                    title: "Professor de Programação",
                    text:
                        "Aulas de Programação Básica e Avançada, Desenvolvimento de Apps, Sites e outras.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
