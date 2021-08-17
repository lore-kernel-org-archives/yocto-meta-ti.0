Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.42458.1629220503440333699
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 10:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C9C0140C53;
	Tue, 17 Aug 2021 17:15:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdJVmOrckCzI; Tue, 17 Aug 2021 17:15:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A901540BA8;
	Tue, 17 Aug 2021 17:15:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0E45B174665; Tue, 17 Aug 2021 13:15:00 -0400 (EDT)
Date: Tue, 17 Aug 2021 13:15:00 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: elberger@amazon.com
Cc: nikhil.nd@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Correct MACHINE for
Message-ID: <20210817171500.GF1528@denix.org>
References: <169C19A45CFCB862.13456@lists.yoctoproject.org>
 <b0f6f1d9-ecfa-de41-5275-d472f84e5305@amazon.com>
 <7729788a-f9fe-689d-2a1f-b18e72fd9cd6@ti.com>
 <cfc8df2d-ce8f-6b4b-d88a-1d4927a6e001@amazon.com>
MIME-Version: 1.0
In-Reply-To: <cfc8df2d-ce8f-6b4b-d88a-1d4927a6e001@amazon.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 12:05:08PM -0400, elberger via lists.yoctoproject=
.org wrote:
> Ok wow that SDK version was released only 6 days ago.=A0 Totally
> missed it.=A0 Thank you.

FWIW, according to the config at [1], this SDK release is based on=20
08.00.00.004 tag in meta-ti/meta-arago, applied about 4 weeks ago.
And meta-processor-sdk adds extra OOBE enhancements on top of that.


> On 8/17/21 11:43 AM, Nikhil Devshatwar via lists.yoctoproject.org wrote=
:
> >CAUTION: This email originated from outside of the organization.
> >Do not click links or open attachments unless you can confirm the
> >sender and know the content is safe.
> >)
> >
> >
> >Hi,
> >
> >On 17/08/21 7:29 pm, elberger via lists.yoctoproject.org wrote:
> >>Nevermind I see it on master branch.
> >>
> >>Bummer it seems like I cannot use it for the LTS branch. Is there any
> >>plan for that?
> >>
> >
> >You should see the machine am64xx-evm
> >The latest SDK release for AM64 Linux is 08.00.00.21=A0 (based on 2021=
 LTS
> >kernel)
> >
> >You can find config file at [1]
> >and the latest release page at [2]
> >
> >[1]
> >https://git.ti.com/cgit/arago-project/oe-layersetup/tree/configs/proce=
ssor-sdk/processor-sdk-08.00.00.21-config.txt
> >
> >[2] https://www.ti.com/tool/download/PROCESSOR-SDK-LINUX-AM64X#release=
-notes
> >
> >Regards,
> >Nikhil D
> >
> >
> >>On 8/17/21 9:02 AM, elberger via lists.yoctoproject.org wrote:
> >>>CAUTION: This email originated from outside of the organization. Do
> >>>not click links or open attachments unless you can confirm the sende=
r
> >>>and know the content is safe.
> >>>
> >>>
> >>>
> >>>Hello
> >>>
> >>>I am looking for the correct MACHINE config for the TMDS64GPEVM.
> >>>
> >>>At this page I do not see any reference to TMDS64GPEVM.
> >>>
> >>>https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/07_03_01_00=
6/exports/docs/linux/Overview_Building_the_SDK.html#processor-sdk-build-r=
eference
> >>>
> >>>
> >>>
> >>>This is the SDK that the board's page points to from here
> >>>
> >>>https://www.ti.com/tool/TMDS64GPEVM
> >>>
> >>>I am also cloning the SDK using the processor-sdk-dunfell-07.01.00.t=
xt
> >>>config if that makes a difference.=A0 Perhaps the configuration is o=
n a
> >>>different branch.
> >>>
> >>>Thank you

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
