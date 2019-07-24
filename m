Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3660EE00E0E; Wed, 24 Jul 2019 15:00:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69991E00DF7
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 15:00:27 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id i21so46001539ljj.3
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 15:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=w7svsDuExysT1BPghheYmx4kGIGV51lI+xQ6aM+qqR0=;
	b=k8aqcvLuUOvDIXEIpc8Ve0YRdy36TahXz0ahyMl1y1rKaBph6LDjKxo5njKp0F/wOS
	M8hwpYipFvRx7OUMw+abw5vRDoIDnE3TVIv+e7mfdrTGaIezKw14QPB0S1yQv9daFzmi
	ljozkjXNZEqjsya2HIbxHQctqyu3K9NcM+kl6fBKuNdB5c9v8ECCHi5n/fKVvVEn6eHr
	/M7y2aePXp6ncRoq3NsPd5yzNO5xGZIgNFkqUg5S+kr0sO07V3JiIuNWykzD8iqf6vQf
	4fX5eW4O+Ay0QiG2Ucp7Q7tZGHWFYlhJxE/AhlFXsFLM0pv86aXBWKGPXi0pD+2ebjyT
	0R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=w7svsDuExysT1BPghheYmx4kGIGV51lI+xQ6aM+qqR0=;
	b=b8+DApCJ8TyFtrFd2fGTITVWgZSdA3RSTcJPYiO/zblzDga7PBgmA/ENbALTIoiX2z
	Bm8nv5sXvBgtox3bQgF+Npz1vBVXBW/mLzNyuXaPNM7k+YrfZxmxrjkTmJOJjUcpMb/5
	6IhZ+PJenovVtmXwi7W2agvBSax4RuSGLXcPE0mWBuHM5rehiRMfztxFH853kiPcBmlY
	rcBX5JRu7ddLmty1ODrQDsSn5SxdBxlupCU5/f4w626GTKIb6zsSvcmlouIfIn8ifi3h
	RKmU3O8++EjhQaMoAK4GzkkfZbVG9qJemtpm0+TI57yzf0aM6VWMP8XUKnFxCeTAx6JY
	a4iQ==
X-Gm-Message-State: APjAAAWCvonxx/iEIrcCBWKAWnERWtJTx1q8MiE6sBwi6J9W9Jivz7Oy
	/rvfxF4HLhn5WEaJW5pHqjt8aDGoS1hLCaOVymQwqw==
X-Google-Smtp-Source: APXvYqyPfRZmArxoiTaeFMueLKjDgibRikbJZUSd66/X70pAIBeviUgz9nhmq9+qgqQxD7tb17W4qfagx4lBsiUCMaI=
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr1192371ljj.68.1564005625809;
	Wed, 24 Jul 2019 15:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.17419.1563996558.2881.meta-ti@yoctoproject.org>
In-Reply-To: <mailman.17419.1563996558.2881.meta-ti@yoctoproject.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 25 Jul 2019 10:00:21 +1200
Message-ID: <CADySD0FixCQpE-yDVEOySTYvNMs8Gu58K3nvaW-a7gWi2gw_uw@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: meta-ti Digest, Vol 94, Issue 24
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
X-List-Received-Date: Wed, 24 Jul 2019 22:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

> Date: Wed, 24 Jul 2019 22:14:21 +0300
> From: Sergei Nikulov <sergey.nikulov@gmail.com>
> To: Andy Pont <andy.pont@sdcsystems.com>
> Cc: meta-ti@yoctoproject.org, Yocto-mailing-list
>         <yocto@yoctoproject.org>
> Subject: Re: [meta-ti] Building for AM335x with meta-ti and meta-qt5
> Message-ID:
>         <CAE7Ac0DuiLDgyP84DOmkXS+6P66evSysao=siy7LXP8_S2p1ug@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> TI develops it's SDK based on Yocto here
> http://arago-project.org/wiki/index.php/Main_Page
>
> The latest master I'm able to use is Thud release.
>

We have been using Thud release from meta-arago and it builds Qt5.11.3
with EGLFS for AM335x.
Make sure add DISTRO_FEATURES_remove = "wayland" in your local.conf

And if you want QT5.12, then you can simply update meta-qt5 to warrior
but have to fix meta-arago Qt5 patches yourself
But most of them are around examples so can be skipped.


> HTH,
> Sergei
>
>
>
> ??, 24 ???. 2019 ?., 21:03 Andy Pont <andy.pont@sdcsystems.com>:
>
> > I am trying to build a Yocto (warrior) image for the AM335x using meta-ti
> > and meta-qt5 that will render directly to the GPU.  Initially this will be
> > for the Beaglebone Black but then ultimately will be for a custom hardware
> > platform.
> >
> > In broad outline, I think, the software stack needs to look a bit like:
> >
> > Qt Application
> > QtBase, QtWebEngine, etc.
> > Qt-OpenGL
> > ti-sgx-ddk
> > AM335x GPU
> >
> > I have included meta-ti and meta-qt5 into my belayers.conf and added
> > ti-sgx-ddk-km, ti-sgx-ddk-um, qtbase and qtwebengine to
> > IMAGE_INSTALL_append.  When I try to bitbake core-image-minimal I start to
> > get a failure to compile ti-sgx-ddk-km with a number of, what appear to be,
> > warnings of the form:
> >
> > KBUILD_EXTRA_SYMBOLS=
> > | grep:
> > /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/amba:
> > Is a directory
> > | grep:
> > /home/me/Yocto/BeagleBoneBlack/tmp/work-shared/beaglebone/kernel-source/include/linux/avf:
> > Is a directory
> >
> > It then ultimately appears to give up with:
> >
> > | ******* Multiarch build: no
> > | ******* Primary arch:    target_armel
> > | ******* Secondary arch:  none
> > | ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may
> > fail.
> > | eurasiacon/build/linux2/toplevel.mk:230:
> > eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or
> > directory
> >
> > Is there a specific kernel I need to define in local.conf that the GPU
> > drivers build against?
> >
> > Also, is there any specific configuration I need to do in order to get Qt
> > to use the SGX OpenGL drivers?
> >
> > I have had a search on the web but not found anything for recent Yocto
> > versions, only very old stuff.
> >
> > -Andy.
> >
> >

