Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24A88E01402
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 05:22:31 -0700 (PDT)
Received: by wibhn14 with SMTP id hn14so1415697wib.11
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 05:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EF6EIXJpLQCUKNqvk6lXn7U2OTzSCgv/BvpGquiBk2Y=;
	b=eB7SvDmhvpJrRliEmHY1LPmFoiQnOi7+e2BPZRgSuolc7EVyYBz5jhAQkRVsm5tRqe
	iGEZnDkuFS08rkrEu/LNswxzHt0YDgvwWuZiPfD9rtGoMl89nAwRNY8ZYO/wscbhBLRo
	vcOc34IspKN7zk0Ea7+HupDHHCYRBz4Ny2yZ1CEXdUBilw+ZcJ/pHRCKXU4dcEel5HuA
	kDTzI/77QBPBnob0quhRhMuyNjD0TB5TFVSNcAB7LREVl0QTYWnHnafozhH5GPDnKcb8
	ng1kjcLx8zh7siGgtE3xlcCaXE0dSD1JneZQ8DzaKCNcek/TPOawx/HWZl15tF7Eijt+
	dvbg==
Received: by 10.180.98.39 with SMTP id ef7mr7176022wib.21.1336738950790;
	Fri, 11 May 2012 05:22:30 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 6sm10231597wiz.1.2012.05.11.05.22.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 05:22:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOd_LFwCH3aCuNsUnX1JHWEyNKVREqdoNAiBZrWLWmevqNsHeQ@mail.gmail.com>
Date: Fri, 11 May 2012 14:22:30 +0200
Message-Id: <09CC0265-E19F-4DB9-B8A6-740969E517CD@dominion.thruhere.net>
References: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
	<20120511044725.GC26492@denix.org>
	<CAOd_LFwCH3aCuNsUnX1JHWEyNKVREqdoNAiBZrWLWmevqNsHeQ@mail.gmail.com>
To: Cliff Brake <cliff.brake@gmail.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk6+iaIdWoAUNyxT4xlMMCyjYms6mvgPFu50mwn191YVMBQ0EC8nXWp5kPwf3WwvORBK1MB
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12: add directory prefix to patch URIs
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
X-List-Received-Date: Fri, 11 May 2012 12:22:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2012, om 13:10 heeft Cliff Brake het volgende geschreven:

> Denys,
>=20
> Thanks for the clarification -- I made the mistake of thinking the
> meta-ti master was on Github (saw it there when Angstrom moved).
>=20
> https://github.com/Angstrom-distribution/meta-ti
>=20
> I notice now at the top of the above page, it says it is a mirror, but
> it may be a good idea to mention in the README where the master repo

The master repo is behind the TI firewall so listing that is only of use =
if you can VPN into TI :)

regards,

Koen=

