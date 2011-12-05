Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 568DEE0030F
	for <meta-ti@yoctoproject.org>; Mon,  5 Dec 2011 11:13:27 -0800 (PST)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pB5JDNPf012984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Dec 2011 13:13:23 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pB5JDNiw023483;
	Mon, 5 Dec 2011 13:13:23 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pB5JDN1c020751;
	Mon, 5 Dec 2011 13:13:23 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 5 Dec 2011 13:13:23 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pB5JDMDV025241;	Mon, 5 Dec 2011 13:13:22 -0600
Message-ID: <4EDD17D2.4000502@ti.com>
Date: Mon, 5 Dec 2011 14:13:22 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>	<4ED4DEF2.2000705@ti.com>	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>	<CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
	<CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
In-Reply-To: <CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 05 Dec 2011 19:13:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2011 06:30 AM, Koen Kooi wrote:
>
> Op 29 nov. 2011, om 18:51 heeft Otavio Salvador het volgende geschreven:
>
>> On Tue, Nov 29, 2011 at 15:48, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>> mkfs.vfat keeps segfaulting at different points, I'll try to find out why.
>>
>> It works fine here.
>>
>> Maybe a change in your layer?
>
> I did some more tests (MACHINE=beaglebone bitbake cloud9-image) and with your patches mkfs.vfat segfaults, without the patches it works. I don't know why that is.
> I do want to get rid of the loopdevices, so if other people on this list can test these patches as well...
>

Do you guys know if a similar method will be available for non-extN 
file-systems?  btrfs is the most likely case to come up first.

If the answer is no, could we keep both methods and just default to the 
no-loop method?

