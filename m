Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A4EDE0034A
	for <meta-ti@yoctoproject.org>; Mon, 23 Jul 2012 03:44:51 -0700 (PDT)
Received: by bkty5 with SMTP id y5so5243618bkt.35
	for <meta-ti@yoctoproject.org>; Mon, 23 Jul 2012 03:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=YkH91ue4y3LHBCdw0fFNmL+I4o8lRDe8TuH3/0tLgcU=;
	b=RgJRizYqcQVdt/WvvQNBqxs0fEttUfZHHRdigV0mjkjtNYmDJ77ma2F5iIvuu0QGzR
	HluFywBLnNqXtcH/e2H+ImjDt1VlY5UWbW1ML3R/ZhToY4tlwks0chX7w52we5dyqnKs
	/vEL1w88rXi7rE1DwwOzfhyCL9TEf6qQXmrpiv5STg42NSQwMbT38KFXrmJBhuekBfDM
	73X3NYE0AEz5Yyb7dEMQ0vjBHUST6uzCp2XnnWHs1lzozdlXYmRqgXB17njouk819o/K
	7EnZD6q6nmoRganXkpSFWCfswgmnOijFGXGhxtbQ2+fk2jmFTyUwWQxzDRyUe8uwcvba
	BBcQ==
Received: by 10.205.126.13 with SMTP id gu13mr7335953bkc.79.1343040290147;
	Mon, 23 Jul 2012 03:44:50 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id hs2sm6909410bkc.1.2012.07.23.03.44.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 03:44:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343038119-18176-1-git-send-email-vladimir_zapolskiy@mentor.com>
Date: Mon, 23 Jul 2012 12:44:37 +0200
Message-Id: <624CD066-065F-4501-A422-832835670753@dominion.thruhere.net>
References: <1343038119-18176-1-git-send-email-vladimir_zapolskiy@mentor.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk7RldbfIRa6YyWwlVVCaMUQguYAqdvJjsliQ+kQxo8I3GLQz8z9jMswl8DvhxDKrgQ0Zil
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-omap-psp 2.6.32: fix am37x-evm build
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
X-List-Received-Date: Mon, 23 Jul 2012 10:44:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 jul. 2012, om 12:08 heeft Vladimir Zapolskiy het volgende =
geschreven:

> This change removes two supplementary patches from the list of applied
> patches, the functionality of the patches isn't valuable, and the
> unmodified provided sources can't be compiled with recent toolchains.
>=20
> The change fixes a compilation problem with binutils-2.21 or higher:
>=20
>  Error: selected processor does not support ARM mode `smc #0'

There are already a number of patches in meta-ti to patch the kernel =
makefiles instead of removing these patches, so please go that route.=

