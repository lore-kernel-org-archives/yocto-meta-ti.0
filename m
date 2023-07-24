Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E106AC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 10:21:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.44309.1690194092858867215
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 03:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Iys27lc1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36OALTl8058495;
	Mon, 24 Jul 2023 05:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690194089;
	bh=7+FSZA4lW2+Pz7p5UD60N9fS9WFGDttms4JqG4ng2oc=;
	h=From:To:CC:Subject:Date;
	b=Iys27lc1tR3TfmxKoM1BL0ao77PiS2axx9dWv+N/p4e+NTCKF56Sie+Qj2SYGPw5B
	 RE/rbUbCTZNeTifEEri9b2klWGVPyBBPY4JbbPCY/qeJM5jabHtM+rgksxpSOSbpFO
	 u/A2PPrEMuVi4rVXgkCeWoGWeQqAv/Xd4INQpVCY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36OALTGp011231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jul 2023 05:21:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jul 2023 05:21:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jul 2023 05:21:29 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36OALRLK014196;
	Mon, 24 Jul 2023 05:21:27 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: licenses: Update TI-TSPA license file
Date: Mon, 24 Jul 2023 15:51:24 +0530
Message-ID: <20230724102124.1613382-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 36OALTl8058495
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jul 2023 10:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16857

- The TI-TSPA license file content we currently have is obsolete. Hence, =
update the content for the same.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/licenses/TI-TSPA | 207 +++--------------------------------
 1 file changed, 16 insertions(+), 191 deletions(-)

diff --git a/meta-ti-bsp/licenses/TI-TSPA b/meta-ti-bsp/licenses/TI-TSPA
index fd87c2ac..e91e2892 100644
--- a/meta-ti-bsp/licenses/TI-TSPA
+++ b/meta-ti-bsp/licenses/TI-TSPA
@@ -1,206 +1,31 @@
-Texas Instruments Incorporated
-Technology and Software Publicly Available
-Software License Agreement
+TEXAS INSTRUMENTS TEXT FILE LICENSE
=20
+Copyright (c) 2022 =E2=80=93 2023 Texas Instruments Incorporated
=20
-Important - Please read the following license agreement carefully.  This=
 is
-a legally binding agreement.  Do not click "i have read and agree" or us=
e
-(as applicable) the Licensed Materials unless: (1) you are authorized to
-accept and agree to the terms of this license agreement on behalf of
-yourself or your company (as applicable) and (2) you intend to be bound =
by
-the terms of this license agreement on behalf of yourself or your compan=
y
-(as applicable).
+All rights reserved not granted herein.
=20
-This Software License Agreement ("Agreement") is a legal agreement betwe=
en
-you (either an individual or entity) and Texas Instruments Incorporated
-("TI"), 12500 TI Boulevard, Dallas, Texas 75243.  The "Licensed Material=
s"
-subject to this Agreement include the software programs (in whole or in
-part), that accompany this Agreement and set forth in the applicable
-software manifest and which you access "on-line" and/or electronic
-documentation (in whole or in part) associated and provided with these
-software programs.  By installing, copying or otherwise using the Licens=
ed
-Materials you agree to abide by the terms of this Agreement.  If you cho=
ose
-not to accept or agree with these terms, do not download or install the
-Licensed Materials.
+Limited License. =20
=20
-Note Regarding Possible Access to Open Source Software:  The Licensed
-Materials may be bundled with Open Source Software.  "Open Source Softwa=
re"
-means any software licensed under terms requiring that (A) other softwar=
e
-("Proprietary Software") incorporated, combined or distributed with such
-software or developed using such software: (i) be disclosed or distribut=
ed
-in source code form; or (ii) otherwise be licensed on terms inconsistent
-with the terms of this Agreement, including but not limited to permittin=
g
-use of the Proprietary Software on or with devices other than TI Devices=
, or
-(B) require the owner of Proprietary Software to license any of its pate=
nts
-to users of the Open Source Software and/or Proprietary Software
-incorporated, combined or distributed with such Open Source Software or
-developed using such Open Source Software.
+Texas Instruments Incorporated grants a world-wide, royalty-free, non-ex=
clusive license under copyrights and patents it now or hereafter owns or =
controls to make, have made, use, import, offer to sell and sell ("Utiliz=
e") this software subject to the terms herein.  With respect to the foreg=
oing patent license, such license is granted  solely to the extent that a=
ny such patent is necessary to Utilize the software alone.  The patent li=
cense shall not apply to any combinations which include this software, ot=
her than combinations with devices manufactured by or for TI (=E2=80=9CTI=
 Devices=E2=80=9D).  No hardware patent is licensed hereunder.
=20
-You may gain access to Open Source Software, in which case such Open Sou=
rce
-Software will be listed in the applicable software manifest (in whole or=
 in
-part, the "Open Source Materials").  Your use of the Open Source Materia=
ls
-is subject to the separate licensing terms applicable to such Open Sourc=
e
-Materials as specified in the applicable software manifest.  For
-clarification, this Agreement does not limit your rights under, or grant=
 you
-rights that supersede, the license terms of any applicable Open Source
-Materials license agreement.  If any of the Open Source Materials have b=
een
-provided to you in object code only, TI will provide to you or show you
-where can access the source code versions of such Open Source Materials =
if
-you contact TI at Texas Instruments Incorporated, 12500 TI Boulevard, Ma=
il
-Station 8638, Dallas, Texas 75243, Attention: Contracts Manager.  You ma=
y
-terminate this Agreement in the event you choose not to accept or agree =
with
-the terms in any applicable Open Source Materials license agreement,
-provided that such termination occurs within five (5) calendar days of
-acceptance of this Agreement and you abide by all applicable license ter=
ms
-in this Agreement until such termination.
+Redistributions must preserve existing copyright notices and reproduce t=
his license (including the above copyright notice and the disclaimer and =
(if applicable) source code license limitations below) in the documentati=
on and/or other materials provided with the distribution
=20
-1. License.
+Redistribution and use in binary form, without modification, are permitt=
ed provided that the following conditions are met:
=20
-a. Source Code License.  For the Licensed Materials provided in source c=
ode
-format, TI hereby grants to you a limited, non-exclusive license to
-reproduce, use, and create modified or derivative works of the Licensed
-Materials provided to you in source code format and to distribute an
-unlimited number of copies of such source code Licensed Materials, or an=
y
-derivatives thereof, in any format.
+*	No reverse engineering, decompilation, or disassembly of this software=
 is permitted with respect to any software provided in binary form.
=20
-b.  Object Code License.  For the Licensed Materials provided in object =
code
-format, TI hereby grants to you a limited, non-exclusive license to
-reproduce and use the Licensed Materials provided to you in object code
-format and to distribute an unlimited number of object or executable cop=
ies
-of such object code Licensed Materials.
+*	any redistribution and use are licensed by TI for use only with TI Dev=
ices.
=20
-2. Termination.  This Agreement is effective until terminated.  Without
-prejudice to any other rights, TI may terminate your right to use the
-Licensed Materials under this Agreement if you fail to comply with the t=
erms
-of this Agreement.  In such event, you shall destroy all copies of the
-Licensed Materials, including all portions and derivatives thereof.
+*	Nothing shall obligate TI to provide you with source code for the soft=
ware licensed and provided to you in object code.
=20
-3. Intellectual Property Rights.
+If software source code is provided to you, modification and redistribut=
ion of the source code are permitted provided that the following conditio=
ns are met:
=20
-a. The Licensed Materials being provided to you hereunder are being made
-publicly available by TI, even though they contain copyrighted material =
of
-TI and its licensors, if applicable.   In no event may you alter, remove=
 or
-destroy any copyright notice included in the Licensed Materials.  To the
-extent that any of the Licensed Materials are provided in binary or obje=
ct
-code only, you may not unlock, decompile, reverse engineer, disassemble =
or
-otherwise translate such binary or object code to human-perceivable form.
-The source code of such reverse engineered code may contain TI trade sec=
ret
-and other proprietary information. TI reserves all rights not specifical=
ly
-granted under this Agreement.
+*	any redistribution and use of the source code, including any resulting=
 derivative works, are licensed by TI for use only with TI Devices.
=20
-b. Certain Licensed Materials may (i) require patent licenses from third
-parties claiming patent rights covering implementation of the Licensed
-Materials or (ii) be based on industry recognized standards or software
-programs published by industry recognized standards bodies and certain t=
hird
-parties may claim to own patents or copyrights that cover implementation=
 of
-those standards.  You acknowledge and agree that this Agreement does not
-convey a license to any such third party patents and copyrights.
+*	any redistribution and use of any object code compiled from the source=
 code and any resulting derivative works, are licensed by TI for use only=
 with TI Devices.
=20
-c. YOU ACKNOWLEDGE AND AGREE THAT TI SHALL NOT BE LIABLE FOR AND SHALL N=
OT
-DEFEND OR INDEMNIFY YOU AGAINST ANY THIRD PARTY INFRINGEMENT CLAIM THAT
-RELATES TO OR IS BASED ON YOUR MANUFACTURE, USE, OR DISTRIBUTION OF THE
-LICENSED MATERIALS OR YOUR MANUFACTURE, USE, OFFER FOR SALE, SALE,
-IMPORTATION OR DISTRIBUTION OF YOUR PRODUCTS THAT INCLUDE OR INCORPORATE=
 THE
-LICENSED MATERIALS.
+Neither the name of Texas Instruments Incorporated nor the names of its =
suppliers may be used to endorse or promote products derived from this so=
ftware without specific prior written permission.
=20
-d. You acknowledge and agree that you are responsible for any fees or
-royalties that may be payable to any third party based on such third par=
ty's
-interests in the Licensed Materials described in Section 3(b) above (the
-"Third Party Payment Obligations").  You agree to indemnify TI against a=
ny
-Third Party Payment Obligations and will defend any claim, suit or
-proceeding brought against TI insofar as such claim, suit or proceeding =
is
-based on your failure to pay any Third Party Payment Obligations.
+DISCLAIMER.
=20
-4. Warranties and Limitations.  THE LICENSED MATERIALS ARE PROVIDED "AS =
IS".
-TI AND ITS LICENSORS MAKE NO WARRANTY OR REPRESENTATION, EXPRESS, IMPLIE=
D OR
-STATUTORY, INCLUDING ANY IMPLIED WARRANTIES OF MERCHANTIBILITY, FITNESS =
FOR
-A PARTICULAR PURPOSE, LACK OF VIRUSES, ACCURACY OR COMPLETENESS OF
-RESPONSES, RESULTS AND LACK OF NEGLIGENCE.  TI DISCLAIMS ANY WARRANTY OF
-TITLE, QUIET ENJOYMENT, QUIET POSESSION, AND NON-INFRINGEMENT OF ANY THI=
RD
-PARTY INTELLECTUAL PROPERTY RIGHTS WITH REGARD TO THE LICENSED MATERIALS=
 OR
-USE OF THOSE MATERIALS.
-
-YOU ACKNOWLEDGE AND AGREE THAT THE LICENSED MATERIALS MAY NOT BE INTENDE=
D
-FOR PRODUCTION APPLICATIONS AND MAY CONTAIN IRREGULARITIES AND DEFECTS N=
OT
-FOUND IN PRODUCTION SOFTWARE.  FURTHERMORE, YOU ACKNOWLEDGE AND AGREE TH=
AT
-THE LICENSED MATERIALS HAVE NOT BEEN TESTED OR CERTIFIED BY ANY GOVERNME=
NT
-AGENCY OR INDUSTRY REGULATORY ORGANIZATION OR ANY OTHER THIRD PARTY
-ORGANIZATION.  YOU AGREE THAT PRIOR TO USING, INCORPORATING OR DISTRIBUT=
ING
-THE LICENSED MATERIALS IN OR WITH ANY COMMERCIAL PRODUCT THAT YOU WILL
-THOROUGHLY TEST THE PRODUCT AND THE FUNCTIONALITY OF THE LICENSED MATERI=
ALS
-IN OR WITH THAT PRODUCT AND BE SOLELY RESPONSIBLE FOR ANY PROBLEMS OR
-FAILURES.
-
-IN NO EVENT SHALL TI OR ITS LICENSORS BE LIABLE FOR ANY SPECIAL, INDIREC=
T,
-INCIDENTAL, PUNITIVE OR CONSEQUENTIAL DAMAGES, HOWEVER CAUSED ON ANY THE=
ORY
-OF LIABILITY, ARISING IN ANY WAY OUT OF THIS AGREEMENT, OR YOUR USE OF T=
HE
-LICENSED MATERIALS, WHETHER OR NOT TI HAS BEEN ADVISED OF THE POSSIBILIT=
Y OF
-SUCH DAMAGES.  EXCLUDED DAMAGES INCLUDE, BUT ARE NOT LIMITED TO, COST OF
-REMOVAL OR REINSTALLATION, OUTSIDE COMPUTER TIME, LABOR COSTS, LOSS OR
-CORRUPTION OF DATA, LOSS OF GOODWILL, LOSS OF PROFITS, LOSS OF SAVINGS, =
OR
-LOSS OF USE OR INTERRUPTION OF BUSINESS OR ANY OTHER ECONOMIC LOSS.  IN =
NO
-EVENT WILL TI'S AGGREGATE LIABILITY UNDER THIS AGREEMENT OR ARISING OUT =
OF
-YOUR USE OF THE LICENSED MATERIALS EXCEED FIVE HUNDRED U.S. DOLLARS
-(US$500).
-
-Because some jurisdictions do not allow the exclusion or limitation of
-incidental or consequential damages or limitation on how long an implied
-warranty lasts, the above limitations or exclusions may not apply to you.
-
-5. Export Control.  The Licensed Materials may be subject to the export =
or
-import regulations of certain countries. You agree to comply with all su=
ch
-regulations and acknowledge that you have the responsibility to obtain a=
ny
-licenses or other authorizations that may be required to export, re-expo=
rt
-or import the Licensed Materials.
-
-6. Governing Law, Jurisdiction and Severability.  This Agreement will be
-governed by and interpreted in accordance with the laws of the State of
-Texas, without reference to conflict of laws principles.  If for any rea=
son
-a court of competent jurisdiction finds any provision of the Agreement t=
o be
-unenforceable, that provision will be enforced to the maximum extent
-possible to effectuate the intent of the parties and the remainder of th=
e
-Agreement shall continue in full force and effect. This Agreement shall =
not
-be governed by the United Nations Convention on Contracts for the
-International Sale of Goods, or by the Uniform Computer Information
-Transactions Act (UCITA). The parties agree that non-exclusive jurisdict=
ion
-for any dispute arising out of or relating to this Agreement lies within=
 the
-courts located in the State of Texas.  Notwithstanding the foregoing, an=
y
-judgment may be enforced in any United States or foreign court, and eith=
er
-party may seek injunctive relief in any United States or foreign court.
-Failure by TI to enforce any provision of this Agreement shall not be de=
emed
-a waiver of future enforcement of that or any other provision in this
-Agreement or any other agreement that may be in place between the partie=
s.
-
-7. PRC Provisions.  If you are located in the People's Republic of China
-("PRC") or if the Licensed Materials will be sent to the PRC, the follow=
ing
-provisions shall apply:
-
-a. Registration Requirements.  You shall be solely responsible for
-performing all acts and obtaining all approvals that may be required in
-connection with this Agreement by the government of the PRC, including b=
ut
-not limited to registering pursuant to, and otherwise complying with, th=
e
-PRC Measures on the Administration of Software Products, Management
-Regulations on Technology Import-Export, and Technology Import and Expor=
t
-Contract Registration Management Rules.  Upon receipt of such approvals =
from
-the government authorities, you shall forward evidence of all such appro=
vals
-to TI for its records.  In the event that you fail to obtain any such
-approval or registration, you shall be solely responsible for any and al=
l
-losses, damages or costs resulting therefrom, and shall indemnify TI for=
 all
-such losses, damages or costs.
-
-b. Governing Language.  This Agreement is written and executed in the
-English language.  If a translation of this Agreement is required for an=
y
-purpose, including but not limited to registration of the Agreement purs=
uant
-to any governmental laws, regulations or rules, you shall be solely
-responsible for creating such translation.  Any translation of this
-Agreement into a language other than English is intended solely in order=
 to
-comply with such laws or for reference purposes, and the English languag=
e
-version shall be authoritative and controlling.
-
-8. Entire Agreement.  This is the entire agreement between you and TI an=
d
-supersedes any prior agreement between the parties related to the subjec=
t
-matter of this Agreement. No amendment or modification of this Agreement
-will be effective unless in writing and signed by a duly authorized
-representative of TI.  You hereby warrant and represent that you have
-obtained all authorizations and other applicable consents required
-empowering you to enter into this Agreement.
+THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND A=
NY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPL=
IED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE AR=
E DISCLAIMED. IN NO EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE F=
OR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL=
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS =
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOW=
EVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT L=
IABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY =
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SU=
CH DAMAGE.
--=20
2.34.1


