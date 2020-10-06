Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.12311.1601984754850483171
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 04:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VXoTWvgq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096BjsIo121888
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 06:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601984754;
	bh=s/bst2P67lKj8nS1PMx8/kOI2nyiOfvV/mIbHsc8P54=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=VXoTWvgqYHTLSCGTCWWfALmkFQeKP6mNMJoGKQ0t77cD6aDcdF+I3ZQI1Ua+m24+7
	 daQurgrZCgCodZhYpfRevXPsp9lk75rQ13Uo3cAijUWOV6UNO/kLRFNrI97XtXJRQu
	 Zvsek54UIJM8GTn+vM3Kbfx2IWo3AmV7BYiKFB6E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096Bjseg013412
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 06:45:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 06:45:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 06:45:53 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096BjrsB117175;
	Tue, 6 Oct 2020 06:45:53 -0500
Subject: Re: [dunfell/master PATCH] prueth-fw-am65x-sr2: update AM65 SR2.0 PRU ethernet firmware
To: Roger Quadros <rogerq@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>
References: <20201006082310.5161-1-rogerq@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <000d4e4a-37f2-67b3-9af9-a08b20d8d034@ti.com>
Date: Tue, 6 Oct 2020 06:45:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006082310.5161-1-rogerq@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Roger

On 10/6/20 3:23 AM, Roger Quadros wrote:
> Update to release REL.PRU-ICSS-PROFINET-SWITCH_02.02.07.02

Thanks for the patch but I did this yesterday

http://dflvsu0004.dal.design.ti.com/patch/57752/

Dan


