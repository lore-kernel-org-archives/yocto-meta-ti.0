Return-Path: <jdk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BFE9E006B4
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 18:38:06 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9R1c5lB006969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:38:05 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9R1c5dl018041
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:38:05 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9R1c597010502
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 20:38:05 -0500 (CDT)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Wed, 26 Oct 2011 20:38:05 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] sdcard_image: align partitions with flash pages
Thread-Index: AQHMlEjK+jiJ0hjy+06jYyuoV9tnCZWPaUom
Date: Thu, 27 Oct 2011 01:38:04 +0000
Message-ID: <F61A9010E56D7F4C93A19FD36DAAC3590BAA6D@DFLE34.ent.ti.com>
References: <1319679361-13741-1-git-send-email-jdk@ti.com>
In-Reply-To: <1319679361-13741-1-git-send-email-jdk@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] sdcard_image: align partitions with flash pages
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 01:38:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

See http://github.com/jadonk/meta-texasinstruments for-upstream branch for =
this patch as well.=0A=
________________________________________=0A=
From: Kridner, Jason=0A=
Sent: Wednesday, October 26, 2011 9:36 PM=0A=
To: meta-ti@yoctoproject.org=0A=
Cc: Kridner, Jason=0A=
Subject: [PATCH] sdcard_image: align partitions with flash pages=0A=
=0A=
See=0A=
http://sakoman.com/OMAP/a-script-for-partitioningformatting-a-bootable-sdmi=
crosd-card.html=0A=
=0A=
Signed-off-by: Jason Kridner <jdk@ti.com>=0A=
---=0A=
 classes/sdcard_image.bbclass |    6 +++---=0A=
 1 files changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/classes/sdcard_image.bbclass b/classes/sdcard_image.bbclass=0A=
index 4ebc998..9e4a959 100644=0A=
--- a/classes/sdcard_image.bbclass=0A=
+++ b/classes/sdcard_image.bbclass=0A=
@@ -46,9 +46,9 @@ IMAGE_CMD_sdimg () {=0A=
        SIZE=3D$(/sbin/fdisk -l ${LOOPDEV} | grep Disk | grep bytes | awk '=
{print $5}')=0A=
        CYLINDERS=3D$(echo $SIZE/255/63/512 | bc)=0A=
        {=0A=
-       echo ,9,0x0C,*=0A=
-       echo ,,,-=0A=
-       } | /sbin/sfdisk -D -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}=0A=
+       echo 128,130944,0x0C,*=0A=
+       echo 131072,,,-=0A=
+       } | /sbin/sfdisk -D -uS -H 255 -S 63 -C ${CYLINDERS} ${LOOPDEV}=0A=
=0A=
        # Prepare loop devices for boot and filesystem partitions=0A=
        BOOT_OFFSET=3D32256=0A=
--=0A=
1.7.4.1=0A=
=0A=

