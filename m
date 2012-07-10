Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3937E00280
	for <meta-ti@yoctoproject.org>; Tue, 10 Jul 2012 04:23:15 -0700 (PDT)
Received: by werc12 with SMTP id c12so5278938wer.35
	for <meta-ti@yoctoproject.org>; Tue, 10 Jul 2012 04:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gWcIkmMYIeTWdCQHIpOKBB0+AFk+yws8GH3p/O8Hmdk=;
	b=lnWRnGqM6Aid48MIZpY6VhfpPruBg9lySqj38G4dGkicJyOiKvofrOavDxKkXslI7e
	HNEJtxwd2TlG9RqdtCZnHps1J9C4+NFXq6EZiXNXhRDoFYeJjlykluj4PoWhO8QSdYwX
	kUFPfo6lNkkImbSYnvl5xjIfIP82E2cxXPnkNbWIw8DaYjRWv2ELXRREgeufpkbtNpNQ
	6PD3URO5F51ED4f0wAWINJk9Ipr4o5YIVF8TdW3HgOxCKwLn6UtwCM7ZwBVoqPWOm9xq
	GbyNI8jucHENuEqwE/xvBcOeIxE90LYsyYhiDzMCET9wNC4HCQNwzvkhyvyDfAlMzyxw
	0epQ==
Received: by 10.180.87.232 with SMTP id bb8mr37507424wib.0.1341919394277;
	Tue, 10 Jul 2012 04:23:14 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.95.135])
	by mx.google.com with ESMTPS id t8sm28419346wiy.3.2012.07.10.04.23.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 04:23:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1341837336-1870-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 10 Jul 2012 13:23:09 +0200
Message-Id: <4D3CB362-039A-4891-8425-5A14A0B9C56D@dominion.thruhere.net>
References: <1341837336-1870-1-git-send-email-schnitzeltony@googlemail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnheM13nKe6WW/8gHf5Qzmg9kKnPh2srkHEmTxMSQq+333W0vpIMfe9jRC03PXDW3XbmVec
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] netbase: follow oe-core to v5.0
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
X-List-Received-Date: Tue, 10 Jul 2012 11:23:16 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 9 jul. 2012, om 14:35 heeft Andreas M=FCller het volgende geschreven:

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> .../beagleboard/interfaces                         |    0
> ...{netbase_4.47.bbappend =3D> netbase_5.0.bbappend} |    0
> 2 files changed, 0 insertions(+), 0 deletions(-)
> rename recipes-core/netbase/{netbase-4.47 =3D> =
netbase-5.0}/beagleboard/interfaces (100%)
> rename recipes-core/netbase/{netbase_4.47.bbappend =3D> =
netbase_5.0.bbappend} (100%)
>=20
> diff --git a/recipes-core/netbase/netbase-4.47/beagleboard/interfaces =
b/recipes-core/netbase/netbase-5.0/beagleboard/interfaces
> similarity index 100%
> rename from recipes-core/netbase/netbase-4.47/beagleboard/interfaces
> rename to recipes-core/netbase/netbase-5.0/beagleboard/interfaces
> diff --git a/recipes-core/netbase/netbase_4.47.bbappend =
b/recipes-core/netbase/netbase_5.0.bbappend
> similarity index 100%
> rename from recipes-core/netbase/netbase_4.47.bbappend
> rename to recipes-core/netbase/netbase_5.0.bbappend

FYI, when this goes in we really need a branch to match yocto =
1.2/denzil/whateverfunnyname

regards,

Koen=

