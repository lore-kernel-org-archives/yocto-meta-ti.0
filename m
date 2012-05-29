Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08637E006D9
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 14:18:46 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1412849eaa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 14:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3FWYp5KIjFsrylHWw3Ul0nILxXpcYIfF5ORKnhKcb70=;
	b=lgq2VgikD8kAFSJyzy+I70U+vCumt9OzIj62loJZZO3DT53oROZMuDxbPNeTqDtIUl
	BAXrUweyZ+oF92iDI7f584lNXUGcBR+V8V46BJCndvyIxqPwUQFMrfcY9A79Yv9RJh4t
	ARiUnyfsSdcbzEw7535B+8pMTPr1sMVzlrd6mKJQvEAIfZwHAo7pbW2rpQkVjoUcKcl/
	wThRAkT4HmS3Fw/DwFQn8DCW3MjwRvEJBfUUk/7cjG+Z8Mf/+w6m6SdTqoTMWGvih0se
	lHP0OX2SJ2WmSt01ryl/Q3f0v+x2vDSrB+oThN6beNNSvv8HsxO4O4sspeKrELMNozuO
	cMBg==
Received: by 10.14.127.16 with SMTP id c16mr5222754eei.182.1338326325664;
	Tue, 29 May 2012 14:18:45 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f16sm53173158eec.2.2012.05.29.14.18.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 14:18:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120529205756.GA10106@denix.org>
Date: Tue, 29 May 2012 23:18:39 +0200
Message-Id: <DFB38997-3316-4A6A-8EC3-0F5CC24FBD23@dominion.thruhere.net>
References: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
	<20120529205756.GA10106@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkUHthq0Cowtu3+44bhDBGk4TcPArYTVmhLlM+MpG2gGvOEDR1dRhiN0ttAr307vZOTtHru
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti33x-psp 3.2: sgx fix from PSP + dvi cape audio fix
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
X-List-Received-Date: Tue, 29 May 2012 21:18:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 mei 2012, om 22:57 heeft Denys Dmytriyenko het volgende =
geschreven:

>> This patch is again out of order, as I don't have any of the above =
(0059-0061) -
> are those in your personal tree? Are you going to submit those? Or do =
you want=20
> me to massage this one out of order?
>=20
> Also, the M_K_PR went back to "a" for some reason...

I'd blame gmail smtp servers if I wasn't such an idiot :) You can get =
the complete series from =
https://github.com/Angstrom-distribution/meta-ti/commits/angstrom-staging

I'll create a seperate branch for you to pull for each request in the =
future.

regards,

Koen=

