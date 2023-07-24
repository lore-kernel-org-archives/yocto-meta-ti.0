Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310A4EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 18:56:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2757.1690224983323528385
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 11:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 63F3740C61;
	Mon, 24 Jul 2023 18:56:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BRtNqaBs5S5; Mon, 24 Jul 2023 18:56:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EE7040301;
	Mon, 24 Jul 2023 18:56:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 23751163C10; Mon, 24 Jul 2023 14:56:14 -0400 (EDT)
Date: Mon, 24 Jul 2023 14:56:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: c-shilwant@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org,
	Sai Sree Kartheek Adivi <s-adivi@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Khasim <khasim@ti.com>,
	Gyan Gupta <g-gupta@ti.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: licenses:
 Update TI-TSPA license file
Message-ID: <20230724185614.GO1518@denix.org>
References: <20230724102124.1613382-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230724102124.1613382-1-c-shilwant@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jul 2023 18:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16860

NAK.

TSPA is the old license. The new one is TFL.

What you are doing is replacing TSPA text with TFL text, while still call=
ing=20
it TSPA.

Both of the license files are already available in meta-ti:
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/licenses

And both still need to exist - old components licensed under TSPA need th=
eir=20
license file. New components licensed under TFL should point to TFL, not =
TSPA.

Also, specifying copyright years in the generic license file is not=20
recommended - there will be a lot of unnecessary churn updaing it.


On Mon, Jul 24, 2023 at 03:51:24PM +0530, Chirag Shilwant via lists.yocto=
project.org wrote:
> - The TI-TSPA license file content we currently have is obsolete. Hence=
, update the content for the same.
>=20
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  meta-ti-bsp/licenses/TI-TSPA | 207 +++--------------------------------
>  1 file changed, 16 insertions(+), 191 deletions(-)
>=20
> diff --git a/meta-ti-bsp/licenses/TI-TSPA b/meta-ti-bsp/licenses/TI-TSP=
A
> index fd87c2ac..e91e2892 100644
> --- a/meta-ti-bsp/licenses/TI-TSPA
> +++ b/meta-ti-bsp/licenses/TI-TSPA
> @@ -1,206 +1,31 @@
> -Texas Instruments Incorporated
> -Technology and Software Publicly Available
> -Software License Agreement
> +TEXAS INSTRUMENTS TEXT FILE LICENSE
> =20
> +Copyright (c) 2022 =E2=80=93 2023 Texas Instruments Incorporated
> =20
> -Important - Please read the following license agreement carefully.  Th=
is is
> -a legally binding agreement.  Do not click "i have read and agree" or =
use
> -(as applicable) the Licensed Materials unless: (1) you are authorized =
to
> -accept and agree to the terms of this license agreement on behalf of
> -yourself or your company (as applicable) and (2) you intend to be boun=
d by
> -the terms of this license agreement on behalf of yourself or your comp=
any
> -(as applicable).
> +All rights reserved not granted herein.
> =20
> -This Software License Agreement ("Agreement") is a legal agreement bet=
ween
> -you (either an individual or entity) and Texas Instruments Incorporate=
d
> -("TI"), 12500 TI Boulevard, Dallas, Texas 75243.  The "Licensed Materi=
als"
> -subject to this Agreement include the software programs (in whole or i=
n
> -part), that accompany this Agreement and set forth in the applicable
> -software manifest and which you access "on-line" and/or electronic
> -documentation (in whole or in part) associated and provided with these
> -software programs.  By installing, copying or otherwise using the Lice=
nsed
> -Materials you agree to abide by the terms of this Agreement.  If you c=
hoose
> -not to accept or agree with these terms, do not download or install th=
e
> -Licensed Materials.
> +Limited License. =20
> =20
> -Note Regarding Possible Access to Open Source Software:  The Licensed
> -Materials may be bundled with Open Source Software.  "Open Source Soft=
ware"
> -means any software licensed under terms requiring that (A) other softw=
are
> -("Proprietary Software") incorporated, combined or distributed with su=
ch
> -software or developed using such software: (i) be disclosed or distrib=
uted
> -in source code form; or (ii) otherwise be licensed on terms inconsiste=
nt
> -with the terms of this Agreement, including but not limited to permitt=
ing
> -use of the Proprietary Software on or with devices other than TI Devic=
es, or
> -(B) require the owner of Proprietary Software to license any of its pa=
tents
> -to users of the Open Source Software and/or Proprietary Software
> -incorporated, combined or distributed with such Open Source Software o=
r
> -developed using such Open Source Software.
> +Texas Instruments Incorporated grants a world-wide, royalty-free, non-=
exclusive license under copyrights and patents it now or hereafter owns o=
r controls to make, have made, use, import, offer to sell and sell ("Util=
ize") this software subject to the terms herein.  With respect to the for=
egoing patent license, such license is granted  solely to the extent that=
 any such patent is necessary to Utilize the software alone.  The patent =
license shall not apply to any combinations which include this software, =
other than combinations with devices manufactured by or for TI (=E2=80=9C=
TI Devices=E2=80=9D).  No hardware patent is licensed hereunder.
> =20
> -You may gain access to Open Source Software, in which case such Open S=
ource
> -Software will be listed in the applicable software manifest (in whole =
or in
> -part, the "Open Source Materials").  Your use of the Open Source Mater=
ials
> -is subject to the separate licensing terms applicable to such Open Sou=
rce
> -Materials as specified in the applicable software manifest.  For
> -clarification, this Agreement does not limit your rights under, or gra=
nt you
> -rights that supersede, the license terms of any applicable Open Source
> -Materials license agreement.  If any of the Open Source Materials have=
 been
> -provided to you in object code only, TI will provide to you or show yo=
u
> -where can access the source code versions of such Open Source Material=
s if
> -you contact TI at Texas Instruments Incorporated, 12500 TI Boulevard, =
Mail
> -Station 8638, Dallas, Texas 75243, Attention: Contracts Manager.  You =
may
> -terminate this Agreement in the event you choose not to accept or agre=
e with
> -the terms in any applicable Open Source Materials license agreement,
> -provided that such termination occurs within five (5) calendar days of
> -acceptance of this Agreement and you abide by all applicable license t=
erms
> -in this Agreement until such termination.
> +Redistributions must preserve existing copyright notices and reproduce=
 this license (including the above copyright notice and the disclaimer an=
d (if applicable) source code license limitations below) in the documenta=
tion and/or other materials provided with the distribution
> =20
> -1. License.
> +Redistribution and use in binary form, without modification, are permi=
tted provided that the following conditions are met:
> =20
> -a. Source Code License.  For the Licensed Materials provided in source=
 code
> -format, TI hereby grants to you a limited, non-exclusive license to
> -reproduce, use, and create modified or derivative works of the License=
d
> -Materials provided to you in source code format and to distribute an
> -unlimited number of copies of such source code Licensed Materials, or =
any
> -derivatives thereof, in any format.
> +*	No reverse engineering, decompilation, or disassembly of this softwa=
re is permitted with respect to any software provided in binary form.
> =20
> -b.  Object Code License.  For the Licensed Materials provided in objec=
t code
> -format, TI hereby grants to you a limited, non-exclusive license to
> -reproduce and use the Licensed Materials provided to you in object cod=
e
> -format and to distribute an unlimited number of object or executable c=
opies
> -of such object code Licensed Materials.
> +*	any redistribution and use are licensed by TI for use only with TI D=
evices.
> =20
> -2. Termination.  This Agreement is effective until terminated.  Withou=
t
> -prejudice to any other rights, TI may terminate your right to use the
> -Licensed Materials under this Agreement if you fail to comply with the=
 terms
> -of this Agreement.  In such event, you shall destroy all copies of the
> -Licensed Materials, including all portions and derivatives thereof.
> +*	Nothing shall obligate TI to provide you with source code for the so=
ftware licensed and provided to you in object code.
> =20
> -3. Intellectual Property Rights.
> +If software source code is provided to you, modification and redistrib=
ution of the source code are permitted provided that the following condit=
ions are met:
> =20
> -a. The Licensed Materials being provided to you hereunder are being ma=
de
> -publicly available by TI, even though they contain copyrighted materia=
l of
> -TI and its licensors, if applicable.   In no event may you alter, remo=
ve or
> -destroy any copyright notice included in the Licensed Materials.  To t=
he
> -extent that any of the Licensed Materials are provided in binary or ob=
ject
> -code only, you may not unlock, decompile, reverse engineer, disassembl=
e or
> -otherwise translate such binary or object code to human-perceivable fo=
rm.
> -The source code of such reverse engineered code may contain TI trade s=
ecret
> -and other proprietary information. TI reserves all rights not specific=
ally
> -granted under this Agreement.
> +*	any redistribution and use of the source code, including any resulti=
ng derivative works, are licensed by TI for use only with TI Devices.
> =20
> -b. Certain Licensed Materials may (i) require patent licenses from thi=
rd
> -parties claiming patent rights covering implementation of the Licensed
> -Materials or (ii) be based on industry recognized standards or softwar=
e
> -programs published by industry recognized standards bodies and certain=
 third
> -parties may claim to own patents or copyrights that cover implementati=
on of
> -those standards.  You acknowledge and agree that this Agreement does n=
ot
> -convey a license to any such third party patents and copyrights.
> +*	any redistribution and use of any object code compiled from the sour=
ce code and any resulting derivative works, are licensed by TI for use on=
ly with TI Devices.
> =20
> -c. YOU ACKNOWLEDGE AND AGREE THAT TI SHALL NOT BE LIABLE FOR AND SHALL=
 NOT
> -DEFEND OR INDEMNIFY YOU AGAINST ANY THIRD PARTY INFRINGEMENT CLAIM THA=
T
> -RELATES TO OR IS BASED ON YOUR MANUFACTURE, USE, OR DISTRIBUTION OF TH=
E
> -LICENSED MATERIALS OR YOUR MANUFACTURE, USE, OFFER FOR SALE, SALE,
> -IMPORTATION OR DISTRIBUTION OF YOUR PRODUCTS THAT INCLUDE OR INCORPORA=
TE THE
> -LICENSED MATERIALS.
> +Neither the name of Texas Instruments Incorporated nor the names of it=
s suppliers may be used to endorse or promote products derived from this =
software without specific prior written permission.
> =20
> -d. You acknowledge and agree that you are responsible for any fees or
> -royalties that may be payable to any third party based on such third p=
arty's
> -interests in the Licensed Materials described in Section 3(b) above (t=
he
> -"Third Party Payment Obligations").  You agree to indemnify TI against=
 any
> -Third Party Payment Obligations and will defend any claim, suit or
> -proceeding brought against TI insofar as such claim, suit or proceedin=
g is
> -based on your failure to pay any Third Party Payment Obligations.
> +DISCLAIMER.
> =20
> -4. Warranties and Limitations.  THE LICENSED MATERIALS ARE PROVIDED "A=
S IS".
> -TI AND ITS LICENSORS MAKE NO WARRANTY OR REPRESENTATION, EXPRESS, IMPL=
IED OR
> -STATUTORY, INCLUDING ANY IMPLIED WARRANTIES OF MERCHANTIBILITY, FITNES=
S FOR
> -A PARTICULAR PURPOSE, LACK OF VIRUSES, ACCURACY OR COMPLETENESS OF
> -RESPONSES, RESULTS AND LACK OF NEGLIGENCE.  TI DISCLAIMS ANY WARRANTY =
OF
> -TITLE, QUIET ENJOYMENT, QUIET POSESSION, AND NON-INFRINGEMENT OF ANY T=
HIRD
> -PARTY INTELLECTUAL PROPERTY RIGHTS WITH REGARD TO THE LICENSED MATERIA=
LS OR
> -USE OF THOSE MATERIALS.
> -
> -YOU ACKNOWLEDGE AND AGREE THAT THE LICENSED MATERIALS MAY NOT BE INTEN=
DED
> -FOR PRODUCTION APPLICATIONS AND MAY CONTAIN IRREGULARITIES AND DEFECTS=
 NOT
> -FOUND IN PRODUCTION SOFTWARE.  FURTHERMORE, YOU ACKNOWLEDGE AND AGREE =
THAT
> -THE LICENSED MATERIALS HAVE NOT BEEN TESTED OR CERTIFIED BY ANY GOVERN=
MENT
> -AGENCY OR INDUSTRY REGULATORY ORGANIZATION OR ANY OTHER THIRD PARTY
> -ORGANIZATION.  YOU AGREE THAT PRIOR TO USING, INCORPORATING OR DISTRIB=
UTING
> -THE LICENSED MATERIALS IN OR WITH ANY COMMERCIAL PRODUCT THAT YOU WILL
> -THOROUGHLY TEST THE PRODUCT AND THE FUNCTIONALITY OF THE LICENSED MATE=
RIALS
> -IN OR WITH THAT PRODUCT AND BE SOLELY RESPONSIBLE FOR ANY PROBLEMS OR
> -FAILURES.
> -
> -IN NO EVENT SHALL TI OR ITS LICENSORS BE LIABLE FOR ANY SPECIAL, INDIR=
ECT,
> -INCIDENTAL, PUNITIVE OR CONSEQUENTIAL DAMAGES, HOWEVER CAUSED ON ANY T=
HEORY
> -OF LIABILITY, ARISING IN ANY WAY OUT OF THIS AGREEMENT, OR YOUR USE OF=
 THE
> -LICENSED MATERIALS, WHETHER OR NOT TI HAS BEEN ADVISED OF THE POSSIBIL=
ITY OF
> -SUCH DAMAGES.  EXCLUDED DAMAGES INCLUDE, BUT ARE NOT LIMITED TO, COST =
OF
> -REMOVAL OR REINSTALLATION, OUTSIDE COMPUTER TIME, LABOR COSTS, LOSS OR
> -CORRUPTION OF DATA, LOSS OF GOODWILL, LOSS OF PROFITS, LOSS OF SAVINGS=
, OR
> -LOSS OF USE OR INTERRUPTION OF BUSINESS OR ANY OTHER ECONOMIC LOSS.  I=
N NO
> -EVENT WILL TI'S AGGREGATE LIABILITY UNDER THIS AGREEMENT OR ARISING OU=
T OF
> -YOUR USE OF THE LICENSED MATERIALS EXCEED FIVE HUNDRED U.S. DOLLARS
> -(US$500).
> -
> -Because some jurisdictions do not allow the exclusion or limitation of
> -incidental or consequential damages or limitation on how long an impli=
ed
> -warranty lasts, the above limitations or exclusions may not apply to y=
ou.
> -
> -5. Export Control.  The Licensed Materials may be subject to the expor=
t or
> -import regulations of certain countries. You agree to comply with all =
such
> -regulations and acknowledge that you have the responsibility to obtain=
 any
> -licenses or other authorizations that may be required to export, re-ex=
port
> -or import the Licensed Materials.
> -
> -6. Governing Law, Jurisdiction and Severability.  This Agreement will =
be
> -governed by and interpreted in accordance with the laws of the State o=
f
> -Texas, without reference to conflict of laws principles.  If for any r=
eason
> -a court of competent jurisdiction finds any provision of the Agreement=
 to be
> -unenforceable, that provision will be enforced to the maximum extent
> -possible to effectuate the intent of the parties and the remainder of =
the
> -Agreement shall continue in full force and effect. This Agreement shal=
l not
> -be governed by the United Nations Convention on Contracts for the
> -International Sale of Goods, or by the Uniform Computer Information
> -Transactions Act (UCITA). The parties agree that non-exclusive jurisdi=
ction
> -for any dispute arising out of or relating to this Agreement lies with=
in the
> -courts located in the State of Texas.  Notwithstanding the foregoing, =
any
> -judgment may be enforced in any United States or foreign court, and ei=
ther
> -party may seek injunctive relief in any United States or foreign court=
.
> -Failure by TI to enforce any provision of this Agreement shall not be =
deemed
> -a waiver of future enforcement of that or any other provision in this
> -Agreement or any other agreement that may be in place between the part=
ies.
> -
> -7. PRC Provisions.  If you are located in the People's Republic of Chi=
na
> -("PRC") or if the Licensed Materials will be sent to the PRC, the foll=
owing
> -provisions shall apply:
> -
> -a. Registration Requirements.  You shall be solely responsible for
> -performing all acts and obtaining all approvals that may be required i=
n
> -connection with this Agreement by the government of the PRC, including=
 but
> -not limited to registering pursuant to, and otherwise complying with, =
the
> -PRC Measures on the Administration of Software Products, Management
> -Regulations on Technology Import-Export, and Technology Import and Exp=
ort
> -Contract Registration Management Rules.  Upon receipt of such approval=
s from
> -the government authorities, you shall forward evidence of all such app=
rovals
> -to TI for its records.  In the event that you fail to obtain any such
> -approval or registration, you shall be solely responsible for any and =
all
> -losses, damages or costs resulting therefrom, and shall indemnify TI f=
or all
> -such losses, damages or costs.
> -
> -b. Governing Language.  This Agreement is written and executed in the
> -English language.  If a translation of this Agreement is required for =
any
> -purpose, including but not limited to registration of the Agreement pu=
rsuant
> -to any governmental laws, regulations or rules, you shall be solely
> -responsible for creating such translation.  Any translation of this
> -Agreement into a language other than English is intended solely in ord=
er to
> -comply with such laws or for reference purposes, and the English langu=
age
> -version shall be authoritative and controlling.
> -
> -8. Entire Agreement.  This is the entire agreement between you and TI =
and
> -supersedes any prior agreement between the parties related to the subj=
ect
> -matter of this Agreement. No amendment or modification of this Agreeme=
nt
> -will be effective unless in writing and signed by a duly authorized
> -representative of TI.  You hereby warrant and represent that you have
> -obtained all authorizations and other applicable consents required
> -empowering you to enter into this Agreement.
> +THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND=
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IM=
PLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE =
ARE DISCLAIMED. IN NO EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE=
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTI=
AL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOOD=
S OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) H=
OWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT=
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WA=
Y OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF =
SUCH DAMAGE.
> --=20
> 2.34.1

