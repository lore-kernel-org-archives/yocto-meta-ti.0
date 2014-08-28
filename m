Return-Path: <sona.sarmadi@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C936DE007FE; Thu, 28 Aug 2014 03:26:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 42A7FE0049D
	for <meta-ti@yoctoproject.org>; Thu, 28 Aug 2014 03:26:01 -0700 (PDT)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Thu, 28 Aug 2014 12:25:55 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "denys@ti.com"
	<denys@ti.com>
Thread-Topic: [meta-ti] process for security kernel patches
Thread-Index: Ac/CmC1waDQMnM/iRJem9dsmtfa/yQ==
Date: Thu, 28 Aug 2014 10:25:55 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48256ED0DD@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.140.6]
MIME-Version: 1.0
Subject: process for security kernel patches
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 10:26:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Denys, all,

Can you please inform us what is your process for getting security kernel p=
atches for linux-keystone used in the meta-ti layer (poky/meta-ti/recipes-k=
ernel/linux/linux-keystone_3.10.bb)?=20

Do you  track the -stable updates? Is there a process in place to get secur=
ity related fixes into the meta-ti kernels (e.g. linux-keystone_3.10)?

We have in the past sent some security patches to meta-ti@yoctoproject.org =
list but haven't got any response so far:
Here are some patches:
https://lists.yoctoproject.org/pipermail/meta-ti/2014-August/004980.html
https://lists.yoctoproject.org/pipermail/meta-ti/2014-April/004360.html

We have some more security patches ready for upstream but we are not sure w=
hat your policy is? Can we send these patches as well and wait for them to =
get reviewed and merged or should we stop sending the kernel security patch=
es to "meta-ti@yoctoproject.org" list? Maybe we should upstream in differen=
t way? To another list?

We can of course apply these patches in our own layer (meta-enea) but we wa=
nt to fix in the meta-ti layer and contribute to the Yocto/community (other=
 meta-ti/ linux-keystone users).=20

BR - Sona

Sona Sarmadi
Software Engineer/Security Responsible for Enea Linux
Enea
Jan Stenbecks torg 17,
Box 1033, SE-164 21=A0Kista,=A0Sweden
Direct: +46 8 5071=A0 4475
Mobile: +46 70 971 4475
sona.sarmadi@enea.com
www.enea.com=20



This message, including attachments, is CONFIDENTIAL. It may also be privil=
eged or otherwise protected by law. If you received this email by mistake p=
lease let us know by reply and then delete it from your system; you should =
not copy it or disclose its contents to anyone.


