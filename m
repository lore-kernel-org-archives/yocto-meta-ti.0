Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.472.1581538093983228364
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 12:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fZree7xK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CK8Cac011490;
	Wed, 12 Feb 2020 14:08:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581538092;
	bh=Favik1/8oWSOY3IBo3MiU1FATJnGa3Xa4OMyb9InpNM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fZree7xKX9TZQNEE0jkgwiTzyCYOOp4nFBK0u+Na1GlowJZWTAmDnCX2+fAzsutrf
	 XxEtuOv9GmPdzIzedKRvd+lpa5SiZHf7rUgWWwwTS+JAr36OJFqgGDGA6/0bWOGOdj
	 pOJ7UEOYYxS+fduPoCHm1dPHrdgraYek1qJ+xHF8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CK8CPf053127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Feb 2020 14:08:12 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 14:08:12 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 14:08:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CK8C3E055291;
	Wed, 12 Feb 2020 14:08:12 -0600
Date: Wed, 12 Feb 2020 15:08:11 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: ti-cgt6x bundling libc.a with unreadable ELF file header
Message-ID: <20200212200811.GE30768@beryl>
References: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqBztnkEciT045JbkeYyacjCe91b3FNCkv8k77DLEY=-g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Feb 09, 2020 at 10:26:44AM -0800, Khem Raj wrote:
> Hi
> 
> Recently, I am seeing below packaging error for ti-cgt6x
> 
> https://errors.yoctoproject.org/Errors/Details/390526/

Is this on master? Any specific configuration I should use to get this error? 
I don't think I've ever seen this before or lately...


> eu-readelf also fails to read this file as well as binutils readelf
> also complains
> 
> readelf: Error:
> /mnt/b/yoe/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a(__TI_$$LIBINFO):
> Failed to read file header
> 
> this libc.a is a binary blob so I cant find out how it is. built so
> pinpoint where the problem
> could be.
> 
> since these are DSP blobs should this be ignored from processing and
> just dumped into rootfs
> this will help packager turn a blind eye towards its contents or
> should this be fixed and turned into
> a readable ELF file by normal binutils. I doubt it being a problem
> with tools, since I see same issue
> with elfutils tools as well as binutils ELF manipulation tools.
> 
> Thanks
> -Khem
