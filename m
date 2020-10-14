Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.815.1602689845405091561
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 08:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=md856qwJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09EFbOpQ042836;
	Wed, 14 Oct 2020 10:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602689844;
	bh=rtbso1P1Ta1SBG6dJ0R3rXYKk4MPuC5UDgm/ncDVf9Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=md856qwJKSGqsUpa+BOOfTexNp9bs331b9EfaceKt5x7iJT5gToFrxUtn6maekI8C
	 DjoWRGUNDu0S4gXFBsGdfVV0dW4S+mZOjtlZvFhE4l3KD9P9N6v1pWJPzxlrvqXuOw
	 QKUcd7VMFKGJKCGadOY02810SCZG61vs1YRXaO+0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09EFbOCm019503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Oct 2020 10:37:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 14
 Oct 2020 10:37:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 14 Oct 2020 10:37:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09EFbN8U045356;
	Wed, 14 Oct 2020 10:37:23 -0500
Date: Wed, 14 Oct 2020 11:37:23 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <dmurphy@ti.com>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH v2] ti-pdk-fetch.bbclass: Do not emit trailing slash during S forming
Message-ID: <20201014153723.GI14852@beryl>
References: <20201013214911.339265-1-raj.khem@gmail.com>
 <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
MIME-Version: 1.0
In-Reply-To: <871d4dcf-3429-16a4-e0b5-638d25404e38@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 09EFbOpQ042836
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 10:35:13AM -0500, Dan Murphy via lists.yoctoproje=
ct.org wrote:
> Khem
>=20
> On 10/13/20 4:49 PM, Khem Raj wrote:
> >latest OE-core does not promote using trailing slash to make pseudo's
> >life easier
> >
> >Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >---
> >v2: Strip slash from S if it exists
>=20
> There were 2 patches submitted with v1.=A0 Do we just drop the RTOS pat=
ch now?

Dan,

I believe it is also needed.

Denys
