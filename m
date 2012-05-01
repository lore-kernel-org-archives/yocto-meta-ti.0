Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 949B2E0030B
	for <meta-ti@yoctoproject.org>; Tue,  1 May 2012 12:30:08 -0700 (PDT)
Received: by wgbds11 with SMTP id ds11so3358670wgb.5
	for <meta-ti@yoctoproject.org>; Tue, 01 May 2012 12:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7k9/srfakadH19uFTzNBeu7h/f7F0LFy0enu9gnWBOM=;
	b=J39HNkCWjxhh8LrEPyxCfrBDVEo0EEL38PSG+ORycPh+anvyO1jGlHYYN8xBMDHhuH
	7TIroUfVKyFsz2spRbZQU0bpr3/o06YiPcyRujRRf5DhPIekpwC28kOCzszkza1J9NDV
	TZ8kkgPVOnzjLomRx8dhyeWD7i1pZzgdgol1om2MrAao9FTaNQLyOdaAqd9cJzizL67H
	EwK7BgHy7XeyKpm9cbYRJK7U+dlcm/GCQp2oPGUQt07YRhotEyoFgTykzwkLNxDhBFnA
	GBIJIFgOzCsxN8sQEJtGopg0kab71372EPSvKRoebuLPVM1S34dbUSRlvfRr2PSA+M1V
	AoDg==
Received: by 10.180.80.104 with SMTP id q8mr7462108wix.14.1335900607525;
	Tue, 01 May 2012 12:30:07 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm61012812wiv.11.2012.05.01.12.30.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 12:30:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120501192352.GB26889@bill-the-cat>
Date: Tue, 1 May 2012 21:30:03 +0200
Message-Id: <C157B16C-6127-4B10-9EA2-4FA0D2F532DB@dominion.thruhere.net>
References: <1335899212-29869-1-git-send-email-koen@dominion.thruhere.net>
	<1335899212-29869-5-git-send-email-koen@dominion.thruhere.net>
	<20120501192352.GB26889@bill-the-cat>
To: Tom Rini <trini@ti.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnfFGudUgYyOIXOITa2KXC/cK+vWgMEVUJRI3MjZkeaorLPbdRwrHVozW4cTlNrgiDu8L8v
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC][PATCH 5/5] u-boot 2011.12: switch beagleboard to ext4 to match beaglebone
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
X-List-Received-Date: Tue, 01 May 2012 19:30:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mei 2012, om 21:23 heeft Tom Rini het volgende geschreven:

> On Tue, May 01, 2012 at 09:06:52PM +0200, Koen Kooi wrote:
>> Also add patch to increase ext2 read speed.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Acked-by: Tom Rini <trini@ti.com>

FWIW, I'm tempted to get the latest uboot up and running before sending =
the final patchset. Any opinions on that?

regards,

Koen=

