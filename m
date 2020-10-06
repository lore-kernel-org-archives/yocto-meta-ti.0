Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1921.1602011354408480500
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 12:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SJqDhrko;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096J9DJE030916
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 14:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602011353;
	bh=9ZkQrr5qGbxucOy5xu/YWfHH5l1SLZumG89ikBgg6Go=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SJqDhrkoit+NahEIJutKa9WkBF8eRG00G4fFrbv1GAaHlwtVP8gUVMm5lk6UXl4+1
	 oPq2FyRuxNf1IOfWZh0N++srrpFe8EeaF11bPo+kHHoH28W4jR9wtNbcn5ZvE3zRcU
	 Za1lVpYboXMzv3hvNcSpgJgOCjeZjbalMsXCKfdY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096J9DLo094552
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 14:09:13 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 14:09:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 14:09:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096J9DeX019845;
	Tue, 6 Oct 2020 14:09:13 -0500
Date: Tue, 6 Oct 2020 15:09:12 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: Update to the tag 07.01.000.03
Message-ID: <20201006190912.GL7434@beryl>
References: <20201006185935.15462-1-dmurphy@ti.com>
 <64b5f09f-03a5-9f81-cb6b-fa18054045d9@ti.com>
MIME-Version: 1.0
In-Reply-To: <64b5f09f-03a5-9f81-cb6b-fa18054045d9@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 06, 2020 at 02:02:55PM -0500, Dan Murphy wrote:
> Denys
> 
> On 10/6/20 1:59 PM, Dan Murphy wrote:
> >Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >---
> $subject will be updated to indicate correct tag of 07.01.00.003

Thanks.

> Dan
> 
