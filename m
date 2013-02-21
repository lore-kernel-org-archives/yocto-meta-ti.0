Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 2420CE006F6
	for <meta-ti@yoctoproject.org>; Thu, 21 Feb 2013 04:29:34 -0800 (PST)
Received: from SESTOEX09.enea.se ([fe80::cc12:dcdc:d521:97f8]) by
	SESTOEX08.enea.se ([fe80::fda4:d8b2:80c9:b320%24]) with mapi id
	14.02.0318.001; Thu, 21 Feb 2013 13:29:32 +0100
From: Maxin John <Maxin.John@enea.com>
To: "denys@ti.com" <denys@ti.com>
Thread-Topic: LICENSE related errors while using meta-ti layer
Thread-Index: Ac4QLxlu9Yb8y0W3TK64eKp+jjwrjg==
Date: Thu, 21 Feb 2013 12:29:31 +0000
Message-ID: <46F9BF9187AF5A4AA0AEF94A28ADD22488C678@sestoex09.enea.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.140.59]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: LICENSE related errors while using meta-ti layer
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
X-List-Received-Date: Thu, 21 Feb 2013 12:29:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

While trying to build core-image-minimal for "hawkboard" using poky
and meta-ti layers (master branch), I get the below listed error:

:~/master/poky/build$ bitbake core-image-minimal
ERROR: This recipe does not have the LICENSE field set (cloud9-gnome-image)
ERROR: This recipe does not have the LICENSE field set (cloud9-image)
ERROR: Unable to parse
/home/majo/master/poky/meta-ti/recipes-misc/images/cloud9-gnome-image.bb:
Exited with "1"
ERROR: This recipe does not have the LICENSE field set (cloud9-gfx-image)
ERROR: This recipe does not have the LICENSE field set (ti-hw-bringup-image=
)
ERROR: Command execution failed: Exited with 1

Is it safe to assume "MIT" LICENSE for these recipes ?

Best Regards,
Maxin B. John

