%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% 
%
%                 RAPPORT HCERES 2020 LS2N
%	         FICHE DE STYLE ET COMMANDES
%
%
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

% template book et option
\PassOptionsToClass{a4paper}{book}
\LoadClass{book}
\special{papersize=210mm,297mm}
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Chargement de paquetages additionnels =
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{kpfonts}
\usepackage[autostyle]{csquotes}
\usepackage{xstring} % définit \StrRemoveBraces
\usepackage[hyphens]{url} % pour que le texte ne depasse pas des marges
\usepackage{etoolbox} % pour les conditions if then
\usepackage[nottoc,numbib]{tocbibind} % pour biblio dans table des matières
\usepackage{chngcntr}
\usepackage{array}
\usepackage{wrapfig}
\usepackage{multirow}
\usepackage{tabularx}
\usepackage{tikz} % pour utiliser foreach

\usepackage{enumitem} % pour itemize
\setlist[itemize]{topsep=0pt,itemsep=1pt,partopsep=2pt,parsep=2pt}

\usepackage{amssymb}

% couleurs

\usepackage{colortbl}


\definecolor{darkRed}{rgb}{0.65,0,0}
\definecolor{lightGray}{rgb}{.75,.75,.75}
\definecolor{darkBlue}{rgb}{0,.22,.41}
\definecolor{darkGray}{rgb}{.40,.40,.40}
\definecolor{orange}{rgb}{0.97,0.53,0.38}
\definecolor{seagreen}{rgb}{0.18, 0.55, 0.34}

% Définition de la variable listant toutes les équipes
%\def\listeEquipes{AELOS, ARMEN, COMBI, COMMANDE, DSG, DUKE, GALLINETTE, GDD, IPI, IS3P, MEFORBIO, NAOMOD, OGRE, PACCE, PSI, REV, RIO, ROMAS, SIMS, SLP, STACK, STR, TALN, TASC}
%\def\listeEquipes{AELOS, ARMEN, COMBI, COMMANDE, DSG, DUKE, GALLINETTE, GDD, IPI, IS3P, MEFORBIO, NAOMOD, OGRE, PACCE, PSI, REV, RIO, ROMAS, SIMS, SLP, STACK, STR, TALN, TASC}
\def\listeEquipes{SLP}

\def\listePole{SIEL, SDD, SLS, CCS, RPC}

% package biber pour la biblio et option
\usepackage[backend=biber,giveninits=true,defernumbers=true,maxnames=9999,sorting=ydnt]{biblatex}

\foreach \equipe in \listeEquipes {
	\addbibresource{equipes/\equipe/annexes/\equipe.bib}
}

\DeclareFieldFormat*{title}{\textit{\textbf{#1}}} % titre publication en gras

\setlength{\hoffset}{-58.1pt}        
%\setlength{\oddsidemargin}{85pt} % Marge gauche sur pages impaires
\setlength{\evensidemargin}{75pt} % Marge gauche sur pages paires
\setlength{\marginparwidth}{0pt} % Largeur de note dans la marge
\setlength{\textwidth}{472.27pt} % Largeur de la zone de texte (17cm)
\setlength{\voffset}{-68pt} % Bon pour DOS
%\setlength{\marginparsep}{0pt} % Séparation de la marge
\setlength{\topmargin}{0pt} % Pas de marge en haut
%\setlength{\headheight}{13pt} % Haut de page
%\setlength{\headsep}{10pt} % Entre le haut de page et le texte
%\setlength{\footskip}{8.4pt} % Bas de page + séparation
\setlength{\textheight}{678pt} % Hauteur de la zone de texte (25cm)

\let\tmp\oddsidemargin
\let\oddsidemargin\evensidemargin
\let\evensidemargin\tmp
\reversemarginpar

\setlength{\headheight}{3cm}
\setlength{\footskip}{8.4pt}
%\usepackage{showframe}

%%%%%%%%%%%%%%   commandes commentaires
\newboolean{comment} 

\newcommand{\CommentairesHCERES}[1]{
\ifcomment\textcolor{MidnightBlue}{\textit{\footnotesize#1}}\fi}

\newcommand{\CommentairesDirection}[1]{
\ifcomment\textcolor{seagreen}{\textit{\footnotesize#1}}\fi}


% Liste d'auteurs sélectionnées
\newcommand*{\ls@n@selection}{}

% Supprime un auteur de la liste des auteurs sélectionnés
\newcommand\ls@n@removeselectedauthor[1]{%
  \csundef{ls@n@selected@author@#1}%
}

% Supprime tous les auteurs sélectionnés
\newcommand\clearselectedauthors{%
  \forlistloop{\ls@n@removeselectedauthor}{\ls@n@selection}%
  \renewcommand\ls@n@selection{}%
}

\newcommand\selectauthorsEquipe[1]{
	\ifthenelse{\equal{#1}{IPI}}{  \selectauthors{
    Mona Abid,
    Ali Ak,
    Ahmed Aldahdooh,
    Marcus Barkowsky,
    Madhukar Bhat,
    Zhaoxin Chen,
    Romain Cohendet,
    Antoine Coutrot,
    Erwan David,
    Amira Filali,
    Jeanpierre Guédon,
    Vassilios Krassanakis,
    Lukas Krasula,
    Lukáš Krasula,
    Julien Langlois,
    Pierre Lebranchu,
    Patrick Le Callet,
    Jing Li,
    Suiyi Ling,
    Sofiane Medjkoune,
    Harold Mouchère,
    Karam Naser,
    Nicolas Normand,
    Matthieu Perreira Da Silva,
    Saurabh Puri,
    Yashas Rai,
    Vincent Ricordel,
    Rémi Vallée,
    Christian Viard-Gaudin,
    Toinon Vigier,
    Chengcheng Wang,
    Junle Wang,
    Ting Zhang}  }{}
	
}


% Ajoute un auteur à la liste des auteurs sélectionnés
% FIXME: ne vérifie pas s'il y a des doublons
\newcommand\selectauthor[1]{%
  \listadd\ls@n@selection{#1}%
  \csdef{ls@n@selected@author@#1}{\relax}%
}
% Ajoute plusieurs auteurs, séparés par des virgules, à la
% liste des auteurs sélectionnés
% FIXME: ne vérifie pas s'il y a des doublons
\newcommand\selectauthors[1]{%
  \forcsvlist{\selectauthor}{#1}%
}

% Détermine si un auteur est sélectionné
\newcommand\ifselectedauthor[1]{%
  \nameparts{#1}%
  \begingroup%
    \def\bibnamedelima{ }%
    \def\bibnamedelimb{ }%
    \def\bibnamedelimc{ }%
    \def\bibnamedelimd{ }%
    \def\bibnamedelimi{ }%
    \StrRemoveBraces{\namepartgiven}[\machin]%
    \StrRemoveBraces{\namepartprefix}[\de]%
    \StrRemoveBraces{\namepartfamily}[\bidule]%
    \edef\x{\endgroup\noexpand\ifcsdef{ls@n@selected@author@\machin\space\ifdefvoid{\de}{}{\de\space}\bidule}}\x%
}

% Met en gras les auteurs sélectionnés
\renewbibmacro*{name:hook}[1]{%
  \ifselectedauthor{#1}{\bfseries}{}%
}

% Remplace les auteurs non sélectionnés par des tirets dans les listes de plus
% de 15 coauteurs.
\DeclareNameFormat{author}{%
  \ifselectedauthor{#1}%
  {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  {\ifthenelse{\value{listtotal} > 15}
    {\textemdash}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}}%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}


\DeclareFieldFormat*{labelnumberwidth}{%
  \ifkeyword{braket}{\textbf{\mkbibbrackets{#1}}}{\mkbibbrackets{#1}}}

% Définit des bibliographies de niveau paragraphe
\defbibheading{paragraph}[\refname]{%
  \paragraph*{#1}%
  \if@twoside\markright{\abx@MakeMarkcase{#1}}\fi}

% Redéfinit les bibliographies pour insertion en sections
\defbibheading{subbibintoc}[\refname]{%
  \subsubsection{#1}%
  \if@twoside\markright{\abx@MakeMarkcase{#1}}\fi}

\DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{
        \step[fieldsource=hal_local_reference]
        \step[fieldset=usera,origfieldval]
    }
  }
}

\DeclareBibliographyCategory{revueInter}
\DeclareBibliographyCategory{revueNat}
\DeclareBibliographyCategory{revueAutre}

\DeclareBibliographyCategory{ouvrage}
\DeclareBibliographyCategory{dirouv}
\DeclareBibliographyCategory{chapitre}
\DeclareBibliographyCategory{ouvulga}
\DeclareBibliographyCategory{these}

\DeclareBibliographyCategory{actes}
\DeclareBibliographyCategory{confInter}
\DeclareBibliographyCategory{confNat}
\DeclareBibliographyCategory{poster}

\DeclareBibliographyCategory{logiciel}
\DeclareBibliographyCategory{brevet}
\DeclareBibliographyCategory{rapport}
\DeclareBibliographyCategory{autre}


% Affecte une catégorie unique à chaque entrée bibliographique
\AtDataInput{%
  \iffieldequalstr{usera}{DOUV}%
    {
    	\ifentrytype{book}%
        {\addtocategory{dirouv}{\thefield{entrykey}} }% sinon si type='book' -> dirouv
        {\addtocategory{actes}{\thefield{entrykey}}}% sinon si type='proceedings' -> actes 
    }      
    {\iffieldequalstr{usera}{OV}%
      {\addtocategory{ouvulga}{\thefield{entrykey}}}% sinon si 'OV' -> ouvulga
      {\iffieldequalstr{usera}{SOFTWARE}%
        {\addtocategory{logiciel}{\thefield{entrykey}}}% sinon si 'SOFTWARE' -> logiciel
        {\iffieldequalstr{usera}{BRE}%
          {\addtocategory{brevet}{\thefield{entrykey}}}% sinon si 'BRE' -> brevet
          {\iffieldequalstr{type}{Theses}%
            {\addtocategory{these}{\thefield{entrykey}}}% sinon si champ type='Theses' -> these
             { \ifentrytype{phdthesis}%
             {\addtocategory{these}{\thefield{entrykey}} }% sinon si type='book' -> dirouv
            {\iffieldequalstr{type}{Research Report}%
            {\addtocategory{rapport}{\thefield{entrykey}}}% sinon si champ type='Research Report' -> rapport
            {\iffieldequalstr{type}{Technical Report}%
            {\addtocategory{rapport}{\thefield{entrykey}}}% sinon si champ type='Technical Report' -> rapport
            {\iffieldequalstr{note}{Poster}%
              {\addtocategory{poster}{\thefield{entrykey}}}% sinon si note='poster' -> poster
              {\ifentrytype{book}%
                {\addtocategory{ouvrage}{\thefield{entrykey}}}% sinon si type='book' -> ouvrage
               	 {\ifentrytype{article}% si article
                  {
                  	\iffieldequalstr{usera}{ACLN}{ \addtocategory{revueNat}{\thefield{entrykey}}} % si ACLN -> revueNat 
                	 {\addtocategory{revueInter}{\thefield{entrykey}}}% sinon 'article' -> revueInter
               	  }
                  {\ifentrytype{incollection}%
                    {\addtocategory{chapitre}{\thefield{entrykey}}}% sinon si type='incollection' -> chapitre
                    {\ifentrytype{patent}%
                      {\addtocategory{brevet}{\thefield{entrykey}}}% sinon si type='patent' -> brevet
                      {\ifentrytype{proceedings}%
                        {\addtocategory{actes}{\thefield{entrykey}}}% sinon si type='proceedings' -> actes
                        {\ifentrytype{phdthesis}%
                          {\addtocategory{these}{\thefield{entrykey}}}% sinon si type='phdthesis' -> these
                          {\ifentrytype{inproceedings}{% si communication dans colloc ou congrès
                                \iffieldequalstr{usera}{ACTN}{ \addtocategory{confNat}{\thefield{entrykey}}  } % si ACTN -> confNat
				    			     {  \iffieldequalstr{usera}{ASCT}{ \addtocategory{poster}{\thefield{entrykey}}} % sinon si ASCT -> poster 	
				    			                                     { \addtocategory{confInter}{\thefield{entrykey}}}   }  % sinon confInter
		           }
                           {   \addtocategory{autre}{\thefield{entrykey}}    }% sinon -> non classé
                              
                           }%
                          }%
                         }%
                        }%
                      }%
                    }%
                  }%
                }%
               }%
              }%
            }%
          }%
        }%
      }%
    }%
}
	
\setcounter{tocdepth}{5} % + subsubsections
\setcounter{secnumdepth}{5}

\usepackage{tgadventor}
\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\usepackage[french]{babel}
 \frenchbsetup{StandardLists=true}
\usepackage{color}
\usepackage{colortbl}
\usepackage{tcolorbox}% pour le SWOT
\usepackage{fancyhdr}
\pagestyle{fancy}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{url}
\usepackage{wrapfig}
\usepackage{datetime}
\usepackage[]{graphicx}

\RequirePackage{datatool} %package pour l'insértion et la mise en forme des tableau via fichier csv
\RequirePackage{booktabs} %package pour l'insértion et la mise en forme des tableau via fichier csv
\RequirePackage{float} %package pour les tableaux


%%%%%%%%%%%%%%%%%%%%%%% fin paquetages additionnels 



%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{gris}{gray}{0.97}
\definecolor{gris2}{gray}{0.9}
\definecolor{rouge}{rgb}{0.9,0,0.28}
\definecolor{violet}{rgb}{0.28,0.05,0.48}
\definecolor{bleu}{rgb}{0.20,0.10,0.90}
\definecolor{bleuf}{rgb}{0.15,0.10,0.55}
\definecolor{blanc}{RGB}{255,255,255} 
\usepackage[colorlinks = true,
            linkcolor =bleuf,
            urlcolor  = blue,
            citecolor = blue,
            anchorcolor = blue]{hyperref}
%%%%%%%%%%%%%%%%%%%%%%%%%

 
\fontencoding{T1}
\fontfamily{TeX Gyre Adventor} 
\newcommand{\ALL}{all}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMMANDES et REDEFINITION DE COMMANDES    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pour afficher mois/annee dans footer
\newdateformat{mydateformat}{\monthname~\THEYEAR}
\newcommand{\nomequipe}{xxx}

\newenvironment{TableauCinq}[1]{%
\def\rowtab##1##2##3##4##5{##1 & ##2 & ##3 & ##4 & ##5 \\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{m{3cm} m{3cm} m{3cm} m{2.9cm} m{1.9cm}}
\hline
\multicolumn{5}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
}
{\end{tabular}
}


\newenvironment{TableauSix}[1]{%
\def\rowtab##1##2##3##4##5##6{##1 & ##2 & ##3 & ##4 & ##5 & ##6\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{m{2.5cm} m{2.5cm} m{1.5cm} m{2cm} m{1cm} m{1.8cm}}
\hline
\multicolumn{6}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
\hline
}
{\end{tabular}
}


\newenvironment{TableauSept}[1]{%
\def\rowtab##1##2##3##4##5##6##7{##1 & ##2 & ##3 & ##4 & ##5 & ##6 & ##7\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{tabular}{|m{2,5cm}|m{2,5cm}|m{1,5cm}|m{1,5cm}|m{1,5cm}|m{1,7cm}|m{1,7cm}|}
\hline
\multicolumn{7}{>{\color{white} \columncolor{darkRed}} c}{\bfseries #1}\\
\hline
}
{\end{tabular}
}


% creation d'un tableau à 6 colonnes
\newenvironment{TableauSixContrat}[1]{%
\def\rowtab##1##2##3##4##5##6{##1 & ##2 & ##3 & ##4 & ##5 & ##6\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{center}
\begin{tabular}{m{2.5cm} m{2.5cm} m{2.3cm} m{1cm} m{2cm} m{2.2cm}}
}
{\end{tabular}
\end{center}
}

% creation d'un tableau à 7 colonnes
\newenvironment{TableauSeptContrat}[1]{%
\def\rowtab##1##2##3##4##5##6##7{##1 & ##2 & ##3 & ##4 & ##5 & ##6 & ##7\\}
\definecolor{tcA}{rgb}{1,0.752941,1}
\definecolor{tcB}{rgb}{0.862745,0.862745,0.862745}
\definecolor{tcC}{rgb}{0.764706,0.764706,0.764706}
\begin{center}
\begin{tabular}{m{1cm} m{3.5cm} m{2.8cm} m{2.5cm} m{1.5cm} m{1cm} m{2cm}}
}
{\end{tabular}
\end{center}
}


    %%%%%%%%%%%%%%%%%  affichage détaillé d'un contrat %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affTableauDetailContratsPub}[2]{
\DTLforeach*{#1contratpub}{\lienref=lienreference,\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\duree=Duree,\montantContratLabo=MontantLabo,\montantContratGlobal=MontantTotal,\nbHMois=NbHMois,\coordinateur=Coordinateur,\responsable=Responsablescientifique,\ParticipantsContrat=Participantsequipe,\listePartenaires=Partenaires,\nomDetail=Nomducontrat,\champMotsCle=Motscles,\champResume=Resume}
{
\ifx\empty\lienref\else\label{\lienref}\hypertarget{\lienref}{}\fi
\begin{UnContrat}{\acronyme}
  \PorteurContrat{\porteur}
  \TypeContrat{\typeContrat}
  \OutilFinancement{\outilFinancement}
  \Tutelle{\tutelle}
  \DebutContrat{\debut} 
  \Duree{\duree}
  \MontantLabo{\montantContratLabo}
  \MontantTotal{\montantContratGlobal}
  \NbHMois{\nbHMois}
  \Coordinateur{\coordinateur}
  \Responsable{\responsable}
  \Participants{\ParticipantsContrat}
  \Partenaires{\listePartenaires}
  \NomDetailContrat{\nomDetail}  
  \MotsCles{\champMotsCle}
  \Resume{\champResume}
  \begin{Description}
  \end{Description}
\end{UnContrat}
}
\DTLcleardb{#1contratpub}
\DTLdeletedb{#1contratpub}
 
}

\newcommand{\affTableauDetailContratsPriv}[2]{
\DTLforeach*{#1contratpriv}{\lienref=lienreference,\typeContrat=typeColla,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\duree=Duree,\montantContratLabo=MontantEquipe,\montantContratGlobal=MontantTotal,\coordinateur=Coordinateur,\responsable=Responsablescientifique,\ParticipantsContrat=Participantsequipe,\listePartenaires=Partenaires,\nomDetail=Nomducontrat,\champMotsCle=Motscles,\champResume=Resume}
{
\ifx\empty\lienref\else\label{\lienref}\hypertarget{\lienref}{}\fi
\begin{UnContrat}{\acronyme}
  \PorteurContrat{\porteur}
  \TypeContrat{\typeContrat}
  \OutilFinancement{\outilFinancement}
  \Tutelle{\tutelle}
  \DebutContrat{\debut} 
  \Duree{\duree}
  \MontantLabo{\montantContratLabo}
  \MontantTotal{\montantContratGlobal}
  \Coordinateur{\coordinateur}
  \Responsable{\responsable}
  \Participants{\ParticipantsContrat}
  \Partenaires{\listePartenaires}
  \NomDetailContrat{\nomDetail}  
  \MotsCles{\champMotsCle}
  \Resume{\champResume}
  \begin{Description}
  \end{Description}
\end{UnContrat}
}
\DTLcleardb{#1contratpriv}
\DTLdeletedb{#1contratpriv}
 
}




\newsavebox{\@DescriptionContratBox}
\newbox{\@@DescriptionContratBox}
\newenvironment{UnContrat}[1]{%
 \global\let\@UrlSysteme\@empty
  \global\let\@UrlSystemeBreakLines\@empty
  \gdef\@acronyme{#1}
  \def\PorteurContrat##1{\gdef\@PorteurContrat{##1}}
  \def\TypeContrat##1{\gdef\@TypeContrat{##1}}
  \def\OutilFinancement##1{\gdef\@OutilFinancement{##1}}
  \def\Tutelle##1{\gdef\@Tutelle{##1}}
  \def\DebutContrat##1{\gdef\@DebutContrat{##1}}
  \def\Duree##1{\gdef\@Duree{##1}}
  \def\MontantLabo##1{\gdef\@MontantLabo{##1}}
  \def\MontantTotal##1{\gdef\@MontantTotal{##1}}
  \def\NbHMois##1{\gdef\@NbHMois{##1}}
  \def\Coordinateur##1{\gdef\@Coordinateur{##1}}
  \def\Responsable##1{\gdef\@Responsable{##1}}
  \def\Participants##1{\gdef\@Participants{##1}}
  \def\Partenaires##1{\gdef\@Partenaires{##1}}
  \def\NomDetailContrat##1{\gdef\@NomDetailContrat{##1}}

 \def\UrlDOI##1{\gdef\@UrlSysteme{##1}}
  \def\UrlDOIBreakLines##1{\gdef\@UrlSystemeBreakLines{##1}}
  \def\Description{\begin{lrbox}{\@DescriptionContratBox}%
      \noindent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionContratBox=\vbox{\copy\@DescriptionContratBox}}
\global\let\@MotsCles\@empty  % ajout de condition pour mots clÃ©s 30/03/10
\def\MotsCles##1{\gdef\@MotsCles{##1}}
\global\let\@Resume\@empty  % ajout de condition pour resumé 30/03/10
\def\Resume##1{\gdef\@Resume{##1}}
}{%
{\noindent \textbf{\@TypeContrat}~-~ \textbf{\@acronyme} \if\@Coordinateur \else \hfill\normalsize\mdseries \textbf{Coordinateur~:} \@Coordinateur
\fi
\if\@UrlSysteme
\par
\else
 {\small\texttt{\href{\@UrlSysteme}{\textbf{URL}}}} %modif2708 on rend clickable le mot URL
\fi
}
 \par
\noindent \@NomDetailContrat
 \par 
\noindent\textbf{D\'ebut~:} \@DebutContrat, \textbf{dur\'ee~:} \@Duree \hspace*{0.1cm}mois \par
\if\@Partenaires
\par
\else
\noindent\textbf{Partenaires :} \@Partenaires\par
\fi
\noindent\textbf{Responsable scientifique LS2N : } \@Responsable \par
\if\@Participants
\par 
\else
\noindent\textbf{Participants \'equipe :} \@Participants \par
\fi
\noindent\textbf{Montant Labo :} \@MontantLabo \hspace*{0.1cm}
\if\@MontantTotal
\else 
\hfill\normalsize\mdseries \textbf{Montant total :} \@MontantTotal \hspace*{0.1cm}
\fi \par
% ajout de condition pour mots clÃ©s 30/03/10
\if\@MotsCles
\par
\else
\noindent\textbf{Mots cl\'es :}
 \@MotsCles \par
\fi
\if\@Resume
\par
\else
\noindent\textbf{Résumé :}
 \@Resume\par
\fi
  \medskip
  \vbox{\unvcopy\@@DescriptionContratBox}
}

     %%%%%%%%%%%%%%%%%  affichage synthese d'un contrat %%%%%%%%%%%%%%%%%%%%%%%%%
 % Porteur | Outil de financement | Nom (ou Acronyme ?, à voir) | Tutelle gestionnaire | Début (mois/année après réflexion je pense) | Durée (mois) | Montant (aide) allouée au laboratoire |
                % contrat public %

%\newcommand{\affTableauRecapContratspub}[2]{
%\label{CI-#2}
%\DTLloaddb{#1contratpub}{./equipes/#2/annexes/contratspub_#2.csv}
%\def\total{0}
%\begin{table}[H]
%\label{#1:contratpub}
%\centering
%\begin{TableauSixContrat}{Contrats de recherche financés par des institutions publiques ou caritatives}
%\bfseries Porteur &
%\bfseries Année &
%\bfseries Nom &
%\bfseries Gestion &
%\bfseries Labo(€) &
%\bfseries Total (€)
%\DTLforeach*[\DTLiseq{\typeContrat}{AAPI}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,%\montantLabo=MontantLabo,\montant=MontantTotal}
%{
%   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Internationaux}}}{}
%   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}
%}
%\DTLforeach*[\DTLiseq{\typeContrat}{AAPN}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal}
%{
%   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Nationaux ( ANR, PHRC, FUI INCA, etc)}}}{}
%   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}
%}
%\DTLforeach*[\DTLiseq{\typeContrat}{PIA}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,%\montantLabo=MontantLabo,\montant=MontantTotal}
%{
 %  \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats financés dans le cadre du PIA}}}{}
 %  \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}
%}
%\DTLforeach*[\DTLiseq{\typeContrat}{collTerr}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,%\montantLabo=MontantLabo,\montant=MontantTotal}
%{
%   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats avec les collectivités territoriales}}}{}
%   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}
%}
%\DTLforeach*[\DTLiseq{\typeContrat}{AAP tutelles}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal}
%{
 %  \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAP tutelles}}}{}
%   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}
%}
%\DTLforeach*[\not\DTLiseq{\typeContrat}{AAPI}\and\not\DTLiseq{\typeContrat}{AAPN}\and\not\DTLiseq{\typeContrat}{PIA}\and\not\DTLiseq{\typeContrat}{collTerr}\and\not\DTLiseq{\typeContrat}{AAP tutelles}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal}
%{
 %  \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AUTRES}}}{}
% %  \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
%   \ifthenelse{\equal{\typeContrat}{}}{& \porteur & \debut &  \acronyme & \tutelle & \montantLabo & \montant}{\porteur & \debut & \acronyme & \tutelle & \montantLabo & \montant}}
%\\\hline \hline
%& & & & \multicolumn{2}{r}{Montant total labo~:~}
%\end{TableauSixContrat}
%\end{table}
%} 



     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  affichage synthese d'un contrat %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      contrat public             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     % Porteur | Outil de financement | Nom (ou Acronyme ?, à voir) | Tutelle gestionnaire | Début (mois/année après réflexion je pense) | Durée (mois) | Montant (aide) allouée au laboratoire |
                 
\newcommand{\affTableauRecapContratspub}[2]{
\label{CI-#2}
\DTLloaddb{#1contratpub}{./equipes/#2/annexes/contratspub_#2.csv}
\def\total{0}


\begin{table}[H]
\label{#1:contratpub}
\paragraph*{Contrats dont le LS2N est porteur}
\centering
\begin{TableauSixContrat}{Contrats de recherche financés par des institutions publiques ou caritatives}
\bfseries Financement &
\bfseries Nom &
\bfseries Gestion &
\bfseries Date &
\bfseries Durée (mois) &
\bfseries Montant Labo(€)
\DTLforeach*[\DTLiseq{\typeContrat}{AAPI}\and\DTLiseq{\porteur}{O}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Internationaux}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{AAPN}\and\DTLiseq{\porteur}{O}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Nationaux ( ANR, PHRC, FUI INCA, etc)}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{PIA}\and\DTLiseq{\porteur}{O}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats financés dans le cadre du PIA}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{collTerr}\and\DTLiseq{\porteur}{O}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats avec les collectivités territoriales}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{AAP tutelles}\and\DTLiseq{\porteur}{O}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAP tutelles}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\porteur}{O}\and\not\DTLiseq{\typeContrat}{AAPI}\and\not\DTLiseq{\typeContrat}{AAPN}\and\not\DTLiseq{\typeContrat}{PIA}\and\not\DTLiseq{\typeContrat}{collTerr}\and\not\DTLiseq{\typeContrat}{AAP tutelles}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AUTRES}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\typeContrat}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}}
\\\hline \hline
& & & &  \multicolumn{2}{r}{Montant total labo~:~}
\end{TableauSixContrat}
\end{table}

\begin{table}[H]
\label{#1:contratpub}
\paragraph*{Contrats dont le LS2N est partenaire}
\centering
\begin{TableauSixContrat}{Contrats de recherche financés par des institutions publiques ou caritatives}
\bfseries Financement &
\bfseries Nom &
\bfseries Gestion &
\bfseries Date &
\bfseries Durée (mois) &
\bfseries Montant Labo(€)
\DTLforeach*[\DTLiseq{\typeContrat}{AAPI}\and\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Internationaux}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{AAPN}\and\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats Nationaux ( ANR, PHRC, FUI INCA, etc)}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{PIA}\and\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats financés dans le cadre du PIA}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{collTerr}\and\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats avec les collectivités territoriales}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \porteur & \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\DTLiseq{\typeContrat}{AAP tutelles}\and\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AAP tutelles}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\outilFinancement}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}
}
\DTLforeach*[\(\DTLiseq{\porteur}{N}\or\DTLiseq{\porteur}{NON}\)\and\not\DTLiseq{\typeContrat}{AAPI}\and\not\DTLiseq{\typeContrat}{AAPN}\and\not\DTLiseq{\typeContrat}{PIA}\and\not\DTLiseq{\typeContrat}{collTerr}\and\not\DTLiseq{\typeContrat}{AAP tutelles}]{#1contratpub}{\porteur=Porteur,\typeContrat=TypeContrat,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantLabo=MontantLabo,\montant=MontantTotal,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{AUTRES}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\typeContrat}{}}{& \outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}{\outilFinancement & \acronyme & \tutelle & \debut & \duree & \montantLabo}}
\\\hline \hline
& & & & \multicolumn{2}{r}{Montant total labo~:~}
\end{TableauSixContrat}
\end{table}

} 
		%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      contrat privee industriel            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                % contrat privé Partenaire industriel |  Tutelle gestionnaire | Date de début | Durée (mois) | Montant laboratoire (k€) | Type de collaboration | %

\newcommand{\affTableauRecapContratspriv}[2]{
\label{CI-#2}
\DTLloaddb{#1contratpriv}{./equipes/#2/annexes/contratspriv_#2.csv}
\def\total{0}
\begin{table}[H]
\label{#1:contratpriv}
\centering
\begin{TableauSixContrat}{}
\toprule
\bfseries Partenaire &
\bfseries Tutelle &
\bfseries Date &
\bfseries Durée (mois) &
\bfseries Montant Labo (€) &
\bfseries Type collab.
\DTLforeach*[\DTLiseq{\financement}{CRI}]{#1contratpriv}{\financement=OutilFinancement,\typeContrat=typeColla,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantEquipe=MontantEquipe,\duree=Duree}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Contrats de R\&D avec des industriels}}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\financement}{}}{& \acronyme & \tutelle & \debut & \duree & \montantEquipe & \typeContrat}{\acronyme & \tutelle & \debut & \duree & \montantEquipe & \typeContrat}
}
\DTLforeach*[\DTLiseq{\financement}{CIFRE}]{#1contratpriv}{\financement=OutilFinancement,\typeContrat=typeColla,\outilFinancement=OutilFinancement,\acronyme=Acronyme,\tutelle=Tutelle,\debut=Debut,\montantEquipe=MontantEquipe,\montant=MontantTotal}
{
   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Bourses CIFRE (36 mois) }}}{}
   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
   \ifthenelse{\equal{\financement}{}}{& \acronyme & \tutelle & \debut & \duree & \montantEquipe & \typeContrat}{\acronyme & \tutelle & \debut & \duree & \montantEquipe & \typeContrat}
}
\\\hline \hline
& & & & \multicolumn{2}{r}{Montant total labo~:~}
\\\bottomrule
\hline
\end{TableauSixContrat}
\end{table} 
} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%  affichage des brevets  %%%%%%%%%%%%%%%%%%%%%%%%%

\newsavebox{\@DescriptionBrevetBox}
\newbox{\@@DescriptionBrevetBox}
\newenvironment{UnBrevet}[1]{%
  \gdef\@Intitule{#1}
\def\InventeursLabo##1{\gdef\@InventeursLabo{##1}}
\def\Statut##1{\gdef\@Statut{##1}}
  \def\Description{\begin{lrbox}{\@DescriptionBrevetBox}%
      \noindent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionBrevetBox=\vbox{\copy\@DescriptionBrevetBox}}
}{%
\noindent\textbf{\@Intitule} \par
\noindent\textbf{Participants LS2N :} \@InventeursLabo \par
\noindent\textbf{Statut :} \@Statut
\par
  \medskip
  \vbox{\unvcopy\@@DescriptionBrevetBox}
}

\newcommand{\affDetailBrevet}[2]{
\DTLloaddb{#1brevet}{./equipes/#2/annexes/brevets_#2.csv}
\DTLforeach*{#1brevet}{\statut=statut,\proprietaires=proprietaires,\dateDepot=dateDepot,\depotContrat=depotContrat,\numDepot=numDepot,\dateDelivrance=dateDelivrance,\typeDeValorisation=typeDeValorisation,\participants=participantsLS2N,\intitule=intitule,\motsCles=motsCles,\resume=resume}
{
\begin{UnBrevet}{\intitule}
  \Statut{\statut}
  \InventeursLabo{\participants}
  \begin{Description}
  \end{Description}
\end{UnBrevet}
}
\DTLcleardb{#1brevet}
\DTLdeletedb{#1brevet}
%\vfill
%\rule[\baselineskip]{0pt}{\baselineskip}
}


	%%%%%%%%%%%%%%%%%  affichage des logiciels %%%%%%%%%%%%%%%%%%%%%%%%%

\newsavebox{\@DescriptionLogicielBox}
\newbox{\@@DescriptionLogicielBox}
\newenvironment{UnLogiciel}[1]{%
  \gdef\@Acronyme{#1}
\def\Participants##1{\gdef\@Participants{##1}}
\def\Annee##1{\gdef\@Annee{##1}}
  \def\Description{\begin{lrbox}{\@DescriptionLogicielBox}%
      \noindent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionLogicielBox=\vbox{\copy\@DescriptionLogicielBox}}
}{%
\noindent\textbf{\@Acronyme} \par
\noindent\textbf{Coordinateur :} \@Participants \par
\noindent\textbf{Date :} \@Annee
\par
  \medskip
  \vbox{\unvcopy\@@DescriptionLogicielBox}
}

\newcommand{\affDetailLogiciel}[2]{
\DTLloaddb{#1Logiciel}{./equipes/#2/annexes/logiciels_#2.csv}
\DTLforeach*{#1Logiciel}{\Acronyme=Acronyme,\annee=Annee,\participants=ParticipantsLS2N,\DeclaInv=DeclaInv,\IDDN=IDDN,\proprietaires=proprietaires,\TypeLicence=TypeLicence,\Depot=Depot,\Nbtelech=Nbtelech,\MotsCles=MotsCles,\Resume=Resume}
{
\begin{UnLogiciel}{\Acronyme}
  \Annee{\annee}
  \Participants{\participants}
  \begin{Description}
  \end{Description}
\end{UnLogiciel}
}
\DTLcleardb{#1Logiciel}
\DTLdeletedb{#1Logiciel}
%\vfill
%\rule[\baselineskip]{0pt}{\baselineskip}
}


					 				 	

	%%%%%%%%%%%%%%%%%  affichage des Prototypes et démonstrateurs  %%%%%%%%%%%%%%%%%%%%%%%%%

\newsavebox{\@DescriptionProtoDemoBox}
\newbox{\@@DescriptionProtoDemoBox}
\newenvironment{UnProtoDemo}[1]{
  \gdef\@Nom{#1}
  \def\Porteur##1{\gdef\@Porteur{##1}}
  \def\Participants##1{\gdef\@Participants{##1}}
   \global\let\@MotsCles\@empty  
	\def\MotsCles##1{\gdef\@MotsCles{##1}}
      \global\let\@Resume\@empty  
	\def\Resume##1{\gdef\@Resume{##1}}
	
  \def\Description{\begin{lrbox}{\@DescriptionProtoDemoBox}%
      \indent\begin{minipage}{\textwidth}\itshape}
      \def\endDescription{\end{minipage}\end{lrbox}%
     \global\setbox\@@DescriptionProtoDemoBox=\vbox{\copy\@DescriptionProtoDemoBox}}
}{%
\indent\textsc\textbf{\large$\bullet$~\@Nom}~~\\\\
\indent\textbf{Porteur :} \@Porteur \par
\indent\textbf{Participant :} \@Participants \par
\indent\textbf{Mots Cles :} \@MotsCles 
\par
  \medskip
  \vbox{\unvcopy\@@DescriptionProtoDemoBox}~~\\
}
 
\newcommand{\affProtoDemoPlateform}[2]{
\DTLloaddb{#1protoDemo}{./equipes/#2/annexes/protosDemos#2.csv}
\DTLforeach*[\DTLiseq{\type}{proto}]{#1protoDemo}{\type=type,\participants=Participants,\nom=Intitule,\porteur=Porteur,\motsCles=motsclefs,\resume=resume}
{
	\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Prototypes et démonstrateurs}~~\\}{}
	\begin{UnProtoDemo}{\nom}
	  \Porteur{\porteur}
	  \Participants{\participants}
	  \MotsCles{\motsCles}
	  \Resume{\resume}
	  \begin{Description}\resume
	  \end{Description}
	\end{UnProtoDemo}
}
\DTLforeach*[\DTLiseq{\type}{plateform}]{#1protoDemo}{\type=type,\participants=Participants,\nom=Intitule,\porteur=Porteur,\motsCles=motsclefs,\resume=resume}
{
	\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Plateformes}~~\\}{}
	\begin{UnProtoDemo}{\nom}
	  \Porteur{\porteur}
	  \Participants{\participants}
	  \MotsCles{\motsCles}
	  \Resume{\resume}
	  \begin{Description}\resume
	  \end{Description}
	\end{UnProtoDemo}
}
\DTLcleardb{#1protoDemo}
\DTLdeletedb{#1protoDemo}
}


%%%%%%%%%%%%%%%%%  affichage des expertises techniques  %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affexpertTech}[2]{
\DTLloaddb{#1expertTech}{./equipes/#2/annexes/expertTech#2.csv}
   
	    \DTLforeach*{#1expertTech}{\porteur=porteur,\nature=nature,\periode=periode}
	{
		 \begin{itemize}
	   		 \item \porteur~:~\nature~(\periode)
	   	 \end{itemize}	 	
	}
   
  \DTLcleardb{#1expertTech}
\DTLdeletedb{#1expertTech}
} 

\newcommand{\affActConsult}[2]{
\DTLloaddb{#1ActConsult}{./equipes/#2/annexes/actConsult#2.csv}
   
	    \DTLforeach*{#1ActConsult}{\porteur=porteur,\nature=nature,\periode=periode}
	{
		 \begin{itemize}
	   		 \item \porteur~:~\nature~(\periode)
	   	 \end{itemize}	 	
	}
   
  \DTLcleardb{#1ActConsult}
\DTLdeletedb{#1ActConsult}
} 

\newcommand{\affInstancExpert}[2]{
\DTLloaddb{#1instancExpert}{./equipes/#2/annexes/instancExpert#2.csv}
   
	    \DTLforeach*{#1instancExpert}{\porteur=porteur,\nature=nature,\periode=periode}
	{
		 \begin{itemize}
	   		 \item \porteur~:~\nature~(\periode)
	   	 \end{itemize}	 	
	}
   
  \DTLcleardb{#1instancExpert}
\DTLdeletedb{#1instancExpert}
} 




%%%%%%%%%%%%%%%%%  affichage activités éditoriales  %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affActEdit}[2]{
	\DTLloaddb{#1affActEdit}{./equipes/#2/annexes/affActEdit#2.csv}
		    \DTLforeach*[\DTLiseq{\type}{commEdit}]{#1affActEdit}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
		{	
			\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Participation à des comités éditoriaux}~~\\}{}
			\begin{itemize}
		    	\item \porteur~:~\nature~(\periode)
		     	\end{itemize}
		}
	    \DTLforeach*[\DTLiseq{\type}{dirColl}]{#1affActEdit}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
	{	
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Direction de collections et de séries}~~\\}{}
		\begin{itemize}
	    	\item \porteur~:~\nature~(\periode)
	     	\end{itemize}
	}
  \DTLcleardb{#1affActEdit}
\DTLdeletedb{#1affActEdit}
} 


%%%%%%%%%%%%%%%%%  affichage activités éditoriales  %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affActEval}[2]{
	\DTLloaddb{#1affActEval}{./equipes/#2/annexes/affActEval#2.csv}
	    \DTLforeach*[\DTLiseq{\type}{evalProjet}]{#1affActEval}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
		{	
			\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Projets de recherche}~~\\}{}
			\begin{itemize}
		    	\item \porteur~:~\nature~(\periode)
		     	\end{itemize}
		}
	    \DTLforeach*[\DTLiseq{\type}{evalLabo}]{#1affActEval}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
	{	
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Laboratoires}~~\\}{}
		\begin{itemize}
	    	\item \porteur~:~\nature~(\periode)
	     	\end{itemize}
	}
	    \DTLforeach*[\DTLiseq{\type}{respInstance}]{#1affActEval}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
	{	
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Responsabilités au sein d'instances d'évaluation}~~\\}{}
		\begin{itemize}
	    	\item \porteur~:~\nature~(\periode)
	     	\end{itemize}
	}
	    \DTLforeach*[\DTLiseq{\type}{review}]{#1affActEval}{\type=type,\porteur=porteur,\nature=nature,\periode=periode}
	{	
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Évaluation d’articles et d'ouvrages scientifiques}~~\\}{}
		\begin{itemize}
	    	\item \porteur~:~\nature~(\periode)
	     	\end{itemize}
	}
  \DTLcleardb{#1affActEval}
\DTLdeletedb{#1affActEval}
} 

%%%%%%%%%%%%%%%%%  affichage post Docs chercheurs invités %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affcherchInv}[2]{
\DTLloaddb{#1cherchInv}{./equipes/#2/annexes/postDocsCInv#2.csv}   
	{	
		\DTLforeach*[\DTLiseq{\type}{chInv}]{#1cherchInv}{\type=type,\nomPrenomResponsable=nomPrenomResponsable,\nomPrenomInvite=nomPrenomInvite,\nationalite=nationalite,\etablissement=etablissement,\dateArrivee=dateArrivee,\duree=duree,\objet=objet,\financement=financement,\publications=publications}
		{
			\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Chercheurs accueillis / invités}~~\\}{}
			   \begin{itemize}
			  \item \nomPrenomInvite ~ (\nationalite, établissement d'origine :~\etablissement) ; date d'arrivée :~\dateArrivee ~; durée du séjour : \duree ~; \if\financement :~ \financement ~ ;\fi responsable LS2N :~\nomPrenomResponsable~
			   \end{itemize}
		}
		\DTLforeach*[\DTLiseq{\type}{postDoc}]{#1cherchInv}{\type=type,\nomPrenomResponsable=nomPrenomResponsable,\nomPrenomInvite=nomPrenomInvite,\nationalite=nationalite,\etablissement=etablissement,\dateArrivee=dateArrivee,\duree=duree,\objet=objet,\financement=financement,\publications=publications}
		{
			   \ifthenelse{\value{DTLrowi}=1}{\paragraph*{Post-doctorants}~~\\}{}
			   \begin{itemize}
			  \item \nomPrenomInvite ~ (\nationalite, établissement d'origine :~\etablissement) ; date d'arrivée :~\dateArrivee ~; durée du séjour : \duree ~; \if\financement :~ \financement ~ ;\fi responsable LS2N :~\nomPrenomResponsable~
			   \end{itemize}
		}
			
	}
   
  \DTLcleardb{#1cherchInv}
\DTLdeletedb{#1cherchInv}
} 

\newcommand{\affcherchInvbad}[2]{
\DTLloaddb{#1cherchInv}{./equipes/#2/annexes/postDocsCInv#2.csv}   
	{	
		\begin{table}[H]
			\centering
			\begin{TableauSixContrat}{}
			\toprule
			\bfseries Type &
			\bfseries Année &
			\bfseries Nom &
			\bfseries Gestion &
			\bfseries Equipe(€) &
			\bfseries Total (€)
			\DTLforeach*[\DTLiseq{\type}{chInv}]{#1cherchInv}{\type=type,\nomPrenomResponsable=nomPrenomResponsable,\nomPrenomInvite=nomPrenomInvite,\nationalite=nationalite,\etablissement=etablissement,\dateArrivee=dateArrivee,\duree=duree,\objet=objet,\financement=financement,\publications=publications}
			{
			   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Chercheurs accueillis / invités}}}{}
			   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
			   \nomPrenomResponsable & \nomPrenomInvite & \nationalite & \dateArrivee & \duree & \financement
			}
			\DTLforeach*[\DTLiseq{\type}{postDoc}]{#1cherchInv}{\type=type,\nomPrenomResponsable=nomPrenomResponsable,\nomPrenomInvite=nomPrenomInvite,\nationalite=nationalite,\etablissement=etablissement,\dateArrivee=dateArrivee,\duree=duree,\objet=objet,\financement=financement,\publications=publications}
			{
			   \ifthenelse{\value{DTLrowi}=1}{\\ \hline \multicolumn{6}{c}{\textbf{Post-doctorants}}}{}
			   \\\DTLifoddrow{\rowcolor{tcC}}{\rowcolor{tcB}}
			    \nomPrenomResponsable & \nomPrenomInvite & \nationalite & \dateArrivee & \duree & \financement
			}
			\\\hline \hline
			\end{TableauSixContrat}
		\end{table}
	}
   
  \DTLcleardb{#1cherchInv}
\DTLdeletedb{#1cherchInv}
} 



%%%%%%%%%%%%%%%%%  affichage indices de reconnaissance  %%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\affIndicRecon}[2]{
\DTLloaddb{#1indicRecon}{./equipes/#2/annexes/indicRecon#2.csv}
	    \DTLforeach*[\DTLiseq{\labelType}{prix}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Prix et/ou distinctions}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	         \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{RSS}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Responsabilités dans des sociétés savantes}~~\\}{}
	         \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	         \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{OCI}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Organisation de colloques / congrès internationaux}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{OCN}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Organisation de colloques / congrès nationaux}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{ICE}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		 
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Invitations à des colloques/congrès}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{orgaConfWorkInter}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Organisation de conférences ou workshops internationaux}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{invConfWorkInter}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Invitation à des conférences ou workshops internationaux}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{orgaEcolThema}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Organisation d'écoles thématiques}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{invEcolThema}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Invitations à des écoles thématiques}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{sejEtr}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Séjours dans des laboratoires étrangers}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{invJurThEt}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Participation à des jurys de thèse étrangers}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
	\DTLforeach*[\DTLiseq{\labelType}{AUTRE}]{#1indicRecon}{\nomPrenom=nomPrenom,\intitule=intitule,\labelType=labelType,\duree=duree,\periode=periode}
	{ 
		
		\ifthenelse{\value{DTLrowi}=1}{\paragraph*{Autres indices considérés comme significatifs pour l'équipe}~~\\}{}
	          \begin{itemize}
	         \item \intitule~:~\nomPrenom~(\periode~-~\duree) 
	             \end{itemize}
	         
	}
 \DTLcleardb{#1indicRecon}
\DTLdeletedb{#1indicRecon}

} 


