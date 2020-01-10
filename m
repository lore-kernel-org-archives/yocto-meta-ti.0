Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2538.1578690904285088678
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 13:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EBM/7xLE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: wmills@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00ALF3Dg047573;
	Fri, 10 Jan 2020 15:15:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578690903;
	bh=I4HJCSdCo1ZXa08I8WgkPkCYigL1qebwXyRuBGwWZI4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=EBM/7xLEP7l2DiNcuLl8s5FTpTWu3+sCPs5hB7c7HBaTwkdMWxdx0PyKAIoO3dQbJ
	 OQ/jlaJoth/0eX2yEpJ9CMUDaWouL1lSWXX3jxliMmJlQ4InHPrwqz5NoV2aN2BEpz
	 3E/AzyaSrwxlTqS3GWvcJvU4AWfct466U+p2vc4M=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00ALF3aZ021316
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2020 15:15:03 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 10
 Jan 2020 15:15:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 10 Jan 2020 15:15:01 -0600
Received: from [158.218.117.100] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00ALF1wI122268;
	Fri, 10 Jan 2020 15:15:01 -0600
Subject: Re: [meta-ti] issues with fetching git repos from git.ti.com
To: "Theodore A. Roth" <troth@openavr.org>, <meta-ti@lists.yoctoproject.org>
References: <CAFMvBt15f3nbMMACAHmQCKgQU-hKoP8UwH22AXxj9QprBTY5nA@mail.gmail.com>
From: "William Mills" <wmills@ti.com>
Message-ID: <35bde3f7-3d78-4910-a6d7-40ddec6b01f7@ti.com>
Date: Fri, 10 Jan 2020 16:15:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFMvBt15f3nbMMACAHmQCKgQU-hKoP8UwH22AXxj9QprBTY5nA@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ted

On 1/10/20 3:38 PM, Theodore A. Roth wrote:
> We're using the meta-ti layer in our yocto builds and all this week
> we've been having accessibility issues when fetching the u-boot and
> linux kernel git repos from git.ti.com. Seeing these errors:
> 
>     fatal: unable to connect to git.ti.com:
>     git.ti.com[0: 198.47.28.208]: errno=Connection timed out
> 
> Seems to be worse in our New Zealand offices than in the Colorado US
> offices, but not having much luck today in the US.
>

Thanks for the issue report.
I have fwd your message to the internal team that runs that server.

I tried git protocol from inside the TI network, from Maryland
residential connection, and from the Virgina AWS data center and all
worked OK. (I only tried once each not 10's of times.)

Could it be a DNS issue local to your company?
Anything else that might be common to Colorado and New Zealand?

> We tried to set `UBOOT_GIT_PROTOCOL` to `https` in our bbappend files,
> which helped initially, but isn't helping much today.
> 
> Is there a mirror we can use until this server accessibility improves?
> 

I don't know of any (full) public mirror of the kernel and u-boot repos.


-- Bill

> Ted Roth
> 
> 
> 
> 
