Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.336.1614964457854950075
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 09:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 198.145.29.25, mailfrom: denis@denix.org)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6A16A38C088E
	for <meta-ti@yoctoproject.org>; Fri,  5 Mar 2021 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5D1D240BEC;
	Fri,  5 Mar 2021 17:14:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-7WlaSu1nQV; Fri,  5 Mar 2021 17:14:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 267C0406B7;
	Fri,  5 Mar 2021 17:14:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82A2E174525; Fri,  5 Mar 2021 12:14:12 -0500 (EST)
Date: Fri, 5 Mar 2021 12:14:12 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Nishanth Menon <nm@ti.com>, meta-ti <meta-ti@yoctoproject.org>,
	"Bajjuri, Praneeth" <praneeth@ti.com>
Subject: Re: [EXTERNAL,dunfell] ti-rtos: Fix J7200 builds by dropping evm
Message-ID: <20210305171412.GU4892@denix.org>
References: <20210305064155.5125-1-nm@ti.com>
 <31751cf2-ce18-5e68-57e8-58f347865683@ti.com>
 <20210305071105.o46acaxismlevh2i@clergyman>
 <20210305082358.GT4892@denix.org>
 <72eb91ce-5e29-a79b-cdb4-0a12e6200ee4@ti.com>
MIME-Version: 1.0
In-Reply-To: <72eb91ce-5e29-a79b-cdb4-0a12e6200ee4@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 05, 2021 at 02:38:00PM +0530, Lokesh Vutla wrote:
> Hi Denys,
> 
> On 05/03/21 1:53 pm, Denys Dmytriyenko wrote:
> > On Fri, Mar 05, 2021 at 01:11:05AM -0600, Nishanth Menon wrote:
> >> On 12:34-20210305, Lokesh Vutla wrote:
> >>>
> >>>
> >>> On 05/03/21 6:11 pm, Nishanth Menon via lists.yoctoproject.org wrote:
> >>>> "evm" prefix messes up the pattern matchup for J7200 and falls back into
> >>>> default, as a result, we attempt to pull [1] instead of [2].
> >>>>
> >>>> [1] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_12/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> >>>> [2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/07_03_00_10/coresdk_rtos_j7200_07_03_00_12_firmware.tar.xz
> >>>>
> >>>> Fixes: 77cdfa9f6560 ("ti-rtos: Update metadata and versions for RTOS firmware")
> >>>> Signed-off-by: Nishanth Menon <nm@ti.com>
> >>>
> >>> For the sake of completeness can you add default web link for j7200? I still
> >>> couldn't figure out how the weblink is populated when default is undefined.
> >>>
> >>>   DEFAULT_RTOS_WEBLINK_j7200 =
> >>> "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> >>>
> >>
> >> I believe _j7 does matchup j7200, hence it works and adding _j7200 will
> >> be redundant..
> > 
> > From least specific to most specific for j7200-evm machine:
> > 
> > MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7200-evm"
> 
> Thanks for the explanation. Where does this variable (MACHINEOVERRIDES) get
> populated?

It is being composed from different places. It starts with MACHINE on the 
right. Then SOC_FAMILY list gets built from different .inc files in meta-ti. 
And finally tune features for arch-arm64 prepend it with "aarch64" on the 
left. And it would be "armv5", "armv7a" or "armv7ve" for legacy platforms.

So, roughly MACHINEOVERRIDES=${ARCH}:${SOC_FAMILY}:${MACHINE}


> Thanks and regards,
> Lokesh
> 
> > 
> > For comparison, the same for j7-evm:
> > 
> > MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7-evm"
> > 
> > Or j7-hs-evm:
> > 
> > MACHINEOVERRIDES="aarch64:ti-soc:k3:j7:j7-hs-evm"
> > 
> > All of them are in the same "j7" SOC_FAMILY, as that was supposed to be a 
> > superset for J7 family, even though ended up being rather specific to j721e...
> > 
> > So, when you use _j7 override, that covers j7-evm, j7-hs-evm, j7200-evm an so 
> > on.
> > 
> > 
> >> DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
> >>
> >> I am a noobie on this, so will be interested in folk's feedback.
> >>
> >> -- 
> >> Regards,
> >> Nishanth Menon
> >> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
> >>
> > 
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
