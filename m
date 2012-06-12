Return-Path: <koen@dominion.thruhere.net>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09BFBE0140C
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 06:44:59 -0700 (PDT)
Received: by pbbrq8 with SMTP id rq8so934427pbb.35
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 06:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=RSVIW+E+CLClZmJh0eUtVDl+TikbKficdHxIJXb90M0=;
	b=iH7HNTGtOAZmBWsDIsf4vHjdYGs4Vtr92YXtVHOEqkB+ezAwwgNxVrjjRyNaKOIm9N
	xn/fDv3NFRFkLDE3STVEK0pOG7xUnVKJyf2tDLjLBH99+qqhX1yy1zPAP+YzxwoDfMnf
	KWgFIkIiSvoKfXOx44R9x9LPG4rCi2qg7t2FUlGqGSPHDjbnGuJAHCZ3MEKPlxkND7tn
	4NDF5u5zAw2OokahLcShORXxyicXMC5Pg+weUinyfGmXTxVUcnpuZadotvwNifNNBgPH
	pEmcDvblKIPomEg+GtCvk6KyzDhSlEge048eO1PBDbToxUZis1CpduclXn8yaCQ7sIhN
	STnA==
Received: by 10.68.213.234 with SMTP id nv10mr39037383pbc.56.1339508699648;
	Tue, 12 Jun 2012 06:44:59 -0700 (PDT)
Received: from [192.168.129.61] (173-12-172-217-oregon.hfc.comcastbusiness.net.
	[173.12.172.217])
	by mx.google.com with ESMTPS id oo6sm2087781pbc.22.2012.06.12.06.44.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 06:44:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120612011706.GD30300@denix.org>
Date: Tue, 12 Jun 2012 08:44:59 -0500
Message-Id: <DD1A526D-B7EE-45D1-9DED-C2FB40897FBA@dominion.thruhere.net>
References: <20120612011706.GD30300@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQld9NMCD3TFsdXQ/ZDmD06GOfyNkFFBeZQvwrpxLCqcePg0cCk30f8dSZuANd9S+seDQDJg
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Tue, 12 Jun 2012 13:45:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jun. 2012, om 20:17 heeft Denys Dmytriyenko het volgende =
geschreven:

> Koen, et al,
>=20
> This is a RFC for creating an additional "extras" layer inside meta-ti =
to=20
> contain pieces and components that are either slightly outdated (i.e. =
old=20
> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, =
anything=20
> DSP-related, etc.) or require non-standard dependencies besides =
OE-Core=20
> (systemd?) with the possibility of moving them back to "main" meta-ti =
in the=20
> future, once they become "first-class citizens", i.e. gain current and=20=

> continuing support.

If it's going to be split this way I'd like to move all beagleboard.org =
related things out of meta-ti and into it's own seperate repo. If the =
beagle recipes are demoted to 2nd class citizens we have no incentive =
anymore to be in meta-ti.=

