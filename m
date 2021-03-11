Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.159.1615502244661427911
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 14:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=bR5tKt1V;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12BMbNah073253;
	Thu, 11 Mar 2021 16:37:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615502243;
	bh=Pzif2EcBxh6Iiyy6O5eFgy2PUco9SVHfZcaXrdll8zo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bR5tKt1VMqL+QPt4l2uTl599ylKSBkJc/XOvCvguWWF+PojGY+ynQMW4KFHpp9lpo
	 WfSA1v+mcftVJtfk3oNmcJWoHhS8NC6yJsdTem5LHtac0S3JvuTdNYRRZZtwaTB1jU
	 BPzhU6vgGz83haA7tbfg28oPz7dEyXkejf/1Qe/4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12BMbN7G047009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Mar 2021 16:37:23 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 11
 Mar 2021 16:37:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 11 Mar 2021 16:37:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12BMbNhX022731;
	Thu, 11 Mar 2021 16:37:23 -0600
Date: Thu, 11 Mar 2021 16:37:23 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Dave Tucker <theaethereal@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] Beaglebone Black Ethernet Failures
Message-ID: <20210311223723.qmvmcap3yjn2mzwu@opulently>
References: <15557.1615501082424309597@lists.yoctoproject.org>
 <24755.1615501174442330946@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <24755.1615501174442330946@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 12BMbNah073253
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:19-20210311, Dave Tucker wrote:
> Actually, looking back at it, this was a commit, not a patch.=A0 So yes=
, it is in the u-boot code already.=A0 But it's failing to perform someho=
w.

Interesting. I'd suggest reaching out to linux-omap@vger.kernel.org and
cc beagle list to see what the recommendation is. The rationale of doing
in u-boot is that kernel folks dont like modifying device tree blobs
after kernel has started booting up..

If a patch is known, then usually stable-kernel rules should kick in and
should help percolate the patch back to 5.10 and other stable kernels.

I was glancing through kernelci.org upstream test logs[1] and i had'nt
noticed anything specific on this failure, so it will be interesting to
get a wider viewpoint.. Do be sure to paste the full bootlog (all the
way from u-boot's first print) in pastebin.ubuntu.com or a similar site
when sending the report to the kernel mailing list.

https://kernelci.org/soc/omap2/job/stable/kernel/v5.10.23/plan/baseline-n=
fs/

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
