Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D01B3E013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 08:02:14 -0700 (PDT)
Received: by eaai1 with SMTP id i1so3143533eaa.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 08:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=13r7qP4owLSY+iY6yMKMvDIuhkUwB6Lh9C6TfkVrYg4=;
	b=DqDdERWNLhA0rnICb87Hrp2V7CVDhYFybTG76G+TLkv60IVOW/qPcrZkcrETu4c7xP
	ooIPKsKHT1Ece2d/1Y+ZDQe4TtQhk0B/9CyPFvk6gdo433GcQOzbKxgd/BpyIAV85bYh
	caVdEMSN7X5Rk3Saf6Ln27BeUV1iD9NxBilyivINL5duhWs6VvVYWiu1PIQ1wwkHubtE
	TTisgTQGr25jVxp12D2WcosP1aTbMpEeSuPdHs0EmPfaJ5kj+9OFcqSu3YJ6iIDk3rH0
	xMC5Kd5ck6NAsOrInle7HThZdni39feMd4vJMBVXBkeTq+IoEM4dbaPJc82I41jctbkz
	209A==
Received: by 10.213.9.8 with SMTP id j8mr789735ebj.102.1332169333555;
	Mon, 19 Mar 2012 08:02:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l5sm26141964wia.11.2012.03.19.08.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 08:02:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332169040-8819-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 19 Mar 2012 16:02:11 +0100
Message-Id: <B14CE078-B65F-4169-99EA-97965CE5422A@dominion.thruhere.net>
References: <1332169040-8819-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlRvooUaXYF8dnUIldIB+R85VEw/dgOCc4aficRVQO5r1LpzixbMfe2ZWDSc43d15XhR1p0
Cc: denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti335x-psp 3.2: update to v3.2.11
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
X-List-Received-Date: Mon, 19 Mar 2012 15:02:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 mrt. 2012, om 15:57 heeft Koen Kooi het volgende geschreven:

> Also add script used to generate patches and SRC_URI
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Also available as revision ef8c9219919285f51cf93668901d895280193a99 at =
git://github.com/Angstrom-distribution/meta-ti.git

I forgot to mention: boot tested on beaglebone a3 and a4, xbmc still =
works.

regards,

Koen


