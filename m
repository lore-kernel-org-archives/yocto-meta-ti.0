Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11645.1615393429403762213
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 08:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NgI0fXko;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AGNmqp084112;
	Wed, 10 Mar 2021 10:23:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615393428;
	bh=oUjLxNMRldVrRaQn3mSdPqaXQ/ItxIVTS9plxasjWAU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NgI0fXkoKN6+qexxzP6xshyJzcrQLvyTxRsHb1Hg7PRDAImunsP4gGSsptbV2ssDc
	 lQ2VvJh29ySaeM9dXXeKs1tKQzqCHiRSF8dS+aNU+qbTCQCMWnYSkUz24rYttAeprk
	 0IZEIQBkYmBX2QVNoe4atlYbzRyHVZ/eQVWcFWkM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AGNmP1106447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Mar 2021 10:23:48 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 10
 Mar 2021 10:23:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 10 Mar 2021 10:23:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AGNlFa018682;
	Wed, 10 Mar 2021 10:23:47 -0600
Date: Wed, 10 Mar 2021 10:23:47 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Dave Tucker <theaethereal@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>
Subject: Re: [meta-ti] Beaglebone Black Ethernet Failures
Message-ID: <20210310162347.qoefefbcagky3srn@boxcar>
References: <u0TL.1615382842912667990.O2ud@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <u0TL.1615382842912667990.O2ud@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05:27-20210310, Dave Tucker wrote:
> I have been using a Beaglebone Black for a project for years.=A0 I recent=
ly upgraded from Dunfell to Gatesgarth and again began experiencing a probl=
em with the ethernet interface failing to come online 10% of the time, a pr=
oblem which can only be fixed by a power cycle (not a reboot).=A0 This is a=
 well known problem documented by this thread ( https://groups.google.com/g=
/beagleboard/c/9mctrG26Mc8 ) going back over 7 years.=A0 It's a hardware pr=
oblem, but it does have a software fix.=A0 But that fix must have been left=
 out of recent meta-bbb builds.=A0 I believe previous fixes have been somet=
hing like this patch ( https://github.com/RobertCNelson/bb-kernel/blob/607a=
e2e36477357a4bb222f285fd7460d5230ab9/patches/net/0009-cpsw-search-for-phy.p=
atch ).=A0 That old patch targets the 3.15 kernel and I believe Gatesgarth =
is using 5.10.=A0 Should I expect that patch to work unmodified on 5.10?=A0=
 I don't know low level kernel mechanics well enough to understand what it'=
s really doing.=A0 If that patch won't work, does anyone know how I could p=
roceed to get ethernet working on the Beaglebone Black with current version=
s of Yocto?
>=20
> Dave


Probably addressed in u-boot instead by [1] ?

[1] https://source.denx.de/u-boot/u-boot/-/commit/20c37fb1bfb9f20804645b219=
9699cd815a4d55c


--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
