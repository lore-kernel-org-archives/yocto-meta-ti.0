Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B804AE0044A
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 22:43:51 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1642947eaa.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 22:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=L018/d2gx8aS4nwloMXT+945aAVFLN+MW1M9+L3DPa4=;
	b=DuWOlwokXCQ7cq1AUJl1FtAar1DO19TlxuNJB/OSazXVrtdeLw52rLmyzojbE5IRKG
	/zrRWLt0lqVmB2ZlEXZJFElNWqPAQoQGnon51tDwlnLd+D7WOKl5RG93Uo+zMu3dpgeb
	fBcxR8HbVLZt+Uyq489Nrxi1NV/ejFRkWnxFBO56m3xZQwj7QvvvKO2mcAjCyDXczFNU
	zjYgn3V1vRzKzp3up3uBoAMghoknXHXWTTnPf7OIFlgS38Ix0EpF/GcBUMicecPnH0Rm
	styOehgLKQnR8i6vQGu3+4PQGQLfGW1kJ2vakqLw0/dWz0uQWoLyoBPJs1RmlNZ/gvVx
	vZjg==
Received: by 10.213.21.133 with SMTP id j5mr4881647ebb.28.1337665429965;
	Mon, 21 May 2012 22:43:49 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n52sm101010957eeh.9.2012.05.21.22.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 22:43:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337645555-1805-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 22 May 2012 07:43:45 +0200
Message-Id: <52E11F40-B7EF-41BA-B462-662DDE01C311@dominion.thruhere.net>
References: <1337645555-1805-1-git-send-email-schnitzeltony@googlemail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmJ4I3htEmKAHDnV7kvHqombQUwdVhMc6EtVuNEinB/0VR+pKmRoZTq2afFQ1xl1ElOAPJw
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-mainline: Add patches to enable libertas firmware loading asynchronously
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
X-List-Received-Date: Tue, 22 May 2012 05:43:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 mei 2012, om 02:12 heeft Andreas M=FCller het volgende geschreven:

> When using udev >=3D177 libertas driver does not load properly the =
firmware [1].
> The patches 0001-0016 were taken from [2] and can be viewed at [3]. =
Patch 0017
> I created to fix compiler complaining for missing symbol is_interrupt =
when
> DEBUG set.
> The patch series was tested with meta-gumstix on overo with udev-175 =
and
> udev-182.
>=20
> [1] http://www.spinics.net/lists/linux-wireless/msg85541.html
> [2] =
git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git
> [3] =
http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-next.git;a=3D=
history;f=3Ddrivers/net/wireless/libertas;hb=3DHEAD
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Could you please add the patches to the 'upstream' of this recipe =
instead? https://github.com/beagleboard/kernel/tree/beagleboard-3.2

regards,

Koen


