Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A77AFE013FE
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 01:49:55 -0700 (PDT)
Received: by wgbdt10 with SMTP id dt10so1916400wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2012 01:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=K+zddoDOEzVBI5HNmp2SRDWWG9OHj/lFALj7n/vIcuc=;
	b=V3RE+3X0pBRnw3gSOtMnscg9qq3OEIbdjfpuuN1kyucx+AR3aj2+ZtSX6YtTfluVkt
	zwWNT7hIEAPQ+C3fhLY/qNi2/Iioi322kM9Pib/rlOVldCZkK7vFESXsEM6tg5eE4hUE
	0HjvfU5uVGJEAGrPy3mGYucTyiv0mLpEPDWEzUXe+JJJJwh2dMAb9//GxjhlwJigSXuN
	o0ZzGyhSAoI0fpiYMQQAjygpClQ1IJs7yMgGPG9MQKhM+Fblo2ZyhAHw5qJTzcTiU5Dr
	kOWP+GP+8BBt76KhZ3WUp5IpCe62ZoceVv0fWseH5X2C5R2QTXhW/tmoZyEplCJzKvDo
	u3fw==
Received: by 10.180.79.69 with SMTP id h5mr3094567wix.6.1348217394239;
	Fri, 21 Sep 2012 01:49:54 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm36833823wib.6.2012.09.21.01.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 01:49:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOT3miJNVxKj_v6=w4yT5Dq0MvuXn9COkmGCtL=9u846qoSkQA@mail.gmail.com>
Date: Fri, 21 Sep 2012 10:49:56 +0200
Message-Id: <D404AEB3-A46E-4313-AA43-226B38F40985@dominion.thruhere.net>
References: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
	<20120919135659.GA589@edge>
	<CAOT3miK4MM-LqDC0AFuZh3hH145qrYoxW1w27P4dXRTCR2X=hQ@mail.gmail.com>
	<20120919162639.GC589@edge>
	<CAOT3miK2M7e5AbYLevSqXD7vx7N_+FUY-8P6k4sFXu1Xxjd4sQ@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E630DAF@DLEE09.ent.ti.com>
	<CAOT3miJNVxKj_v6=w4yT5Dq0MvuXn9COkmGCtL=9u846qoSkQA@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmkXdEyCXGqQIWl1OwfRe/N6i4QS0oIlRc2dr61/8kPev4PQpnBjBWxaqYnzC+nZmHP0dkv
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building yocto images with meta-ti
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
X-List-Received-Date: Fri, 21 Sep 2012 08:49:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2012, om 10:44 heeft Nicolas Dechesne <ndec13@gmail.com> het =
volgende geschreven:

> On Thu, Sep 20, 2012 at 2:22 PM, Dmytriyenko, Denys <denys@ti.com> =
wrote:
>> I think you missed my explanation - please re-read. I didn't say you =
should
>> go to denzil, I said you need to update your bblayers.conf
>=20
> ok.. thanks. I thought i had tried your suggestions... after a clean
> rebuild, it did work.
>=20
> so, just to make it clear I was able to build -minimal and -sato
> images with this config
>=20
> Build Configuration:
> BB_VERSION        =3D "1.15.3"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "beagleboard"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.2+snapshot-20120921"
> TUNE_FEATURES     =3D "armv7a vfp neon cortexa9"

A cortex A9 on a beagleboard, wow.=

