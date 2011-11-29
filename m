Return-Path: <wmills@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA753E00309
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 05:32:39 -0800 (PST)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pATDWZwG022881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 07:32:35 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pATDWZiZ021116;
	Tue, 29 Nov 2011 07:32:35 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pATDWZG0027195;
	Tue, 29 Nov 2011 07:32:35 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 29 Nov 2011 07:32:34 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pATDWYOi028885;	Tue, 29 Nov 2011 07:32:34 -0600
Message-ID: <4ED4DEF2.2000705@ti.com>
Date: Tue, 29 Nov 2011 08:32:34 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
In-Reply-To: <4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Tue, 29 Nov 2011 13:32:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/29/2011 08:22 AM, Koen Kooi wrote:
>
> Op 29 nov. 2011, om 13:53 heeft Otavio Salvador het volgende geschreven:
>
>> On Tue, Nov 29, 2011 at 10:41, Otavio Salvador<otavio@ossystems.com.br>  wrote:
>> ...
>> +# Copyright (C) 2011 O.S. Systems Software LTDA.
>> +#
>> +# Create an image that can by written onto a SD card using dd.
>> +#
>> +# External variables needed:
>> +#   ${ROOTFS} - the rootfs image to incorporate
>>
>> I added Joel in copyright noticed as he did the first version of it. You can look at https://github.com/OSSystems/meta-ti/commit/cc8f9eeb2e73c77cdb24f8d8eb2398ea12d660b3
>
> And I wrote the original and then rewrote Joels version. So lets leave out any copyright statement from the class.
>

A copyright notice in a file without an explicit statement of license 
(in the same file) should always be rejected as it will cause major 
problems with all license review processes (including TI's).

I agree with Koen that it is best to just drop the (c) notice.

