Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4472.1589634190963262427
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 16 May 2020 06:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YpXa3ETK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: prasad.jondhale@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04GD39wX014221;
	Sat, 16 May 2020 08:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589634189;
	bh=3RGOXDXr+WVfo2WQIvgniz5YEoSjVXme8C27dLIXs0Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YpXa3ETKARs/so8y4JLJOMPe0t59RnQwb3xlMbCLu/LQ3xPWrXXmx283pT2rycFwN
	 I83Fjmb/VoQ9ByHUy6cOh/pdbpxs7e/weWeaQK8i5viA0FqtgGzZMZNqXsl6c9KvhZ
	 04NWqxwdG/AuGYVYkNvUi3E4O9M/KCg8ZOsAXO0E=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04GD39cs030107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 16 May 2020 08:03:09 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 16
 May 2020 08:03:08 -0500
Received: from DLEE115.ent.ti.com ([fe80::8876:1e51:7a2b:d4c6]) by
 DLEE115.ent.ti.com ([fe80::8876:1e51:7a2b:d4c6%20]) with mapi id
 15.01.1979.003; Sat, 16 May 2020 08:03:08 -0500
From: "Prasad Jondhale" <prasad.jondhale@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [[meta-ti][zeus/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Update SRCREV to latest
Thread-Topic: [[meta-ti][zeus/master PATCH v1] recipes-bsp: cpsw9g-eth-fw:
 Update SRCREV to latest
Thread-Index: AQHWK4AM2cuawTinoU6VhbC8PW3S9aiqrVYw
Date: Sat, 16 May 2020 13:03:08 +0000
Message-ID: <efa260b9e3004d9ca557a9e5bc122ba2@ti.com>
References: <20200516124538.7850-1-prasad.jondhale@ti.com>
In-Reply-To: <20200516124538.7850-1-prasad.jondhale@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.217.202]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch.  The heading mentioned Zeus instead of Dunfell.
Have fixed in next patch=20
http://dflvsu0004.dal.design.ti.com/patch/55025/


Regards,
Prasad


-----Original Message-----
From: Jondhale, Prasad=20
Sent: Saturday, May 16, 2020 6:16 PM
To: Dmytriyenko, Denys
Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org; Jondhale, Pra=
sad
Subject: [[meta-ti][zeus/master PATCH v1] recipes-bsp: cpsw9g-eth-fw: Updat=
e SRCREV to latest

Signed-off-by: Prasad Jondhale <prasad.jondhale@ti.com>
---
 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 =3D> 100755 recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git=
.bb

diff --git a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb b/recipes-bsp/c=
psw9g-eth-fw/cpsw9g-eth-fw_git.bb
old mode 100644
new mode 100755
index 05b2edca..37ba52d0
--- a/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
+++ b/recipes-bsp/cpsw9g-eth-fw/cpsw9g-eth-fw_git.bb
@@ -11,7 +11,7 @@ inherit update-alternatives
=20
 PROTOCOL =3D "git"
 BRANCH =3D "master"
-SRCREV =3D "2f55ffedf0787f9c4c935473967fb88737d22778"
+SRCREV =3D "afe62ada2e91e2665f597ca16eb3888b752016de"
=20
 SRC_URI =3D "git://git.ti.com/glsdk/ti-eth-fw.git;protocol=3D${PROTOCOL};b=
ranch=3D${BRANCH}"
=20
--=20
2.26.2

