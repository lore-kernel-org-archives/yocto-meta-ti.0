Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.591.1612550019961724335
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ar18jbjN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 68ECF38C06BB
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2021 18:33:39 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115IXcvf071614
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:33:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612550018;
	bh=9pT1lKVNHa9naO4/7oGy1Y7300sK7E0PxdJ0iVCtLYU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ar18jbjNVnyM9BzIh/CaZGBxiq8oV/EYUDDAoIe8Hu6qwj/6XLqbZRUduUNwf8gHx
	 xvjJ3X4uOtlf4NEKntMNOL9JUneoYngIEL8pOqSM7WQ07ItcPFIQc2oed7Bke5FxCL
	 +TsE24EkAxsDDusXrixsObEA3Xa+sz9XEunBSqMM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115IXcZU105442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2021 12:33:38 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:33:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:33:38 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115IXcrJ078916;
	Fri, 5 Feb 2021 12:33:38 -0600
Subject: Re: [dunfell/master] [PATCH] Revert "arago-dunfell-next: Temporarily redirect meta-openembedded"
To: <meta-ti@yoctoproject.org>, <praneeth@ti.com>
References: <20210205182810.31292-1-dmurphy@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <e4aa7ce9-e9d5-0fde-c506-b894716a567e@ti.com>
Date: Fri, 5 Feb 2021 12:33:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205182810.31292-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This should goto meta-arago.

Please ignore.

On 2/5/21 12:28 PM, Dan Murphy wrote:
> This reverts commit 99f72a0bd64e3f7e0d395a0bb5c26017d745a185.
> This re-direct does not need to be done now that the fix for the mariadb
> has been merged in dunfell branch.
>
> From: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>   configs/arago-dunfell-next-config.txt | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
> index 14e6fa8c9d6a..8d629c4bf42d 100644
> --- a/configs/arago-dunfell-next-config.txt
> +++ b/configs/arago-dunfell-next-config.txt
> @@ -6,8 +6,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=m
>   #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>   meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
>   meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
> -#meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> -meta-openembedded,ssh://git@bitbucket.itg.ti.com/coresdk_pub/meta-openembedded.git,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>   meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
>   meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
>   oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
