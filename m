Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1855.1601923819395079153
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h/encuXK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IoIDB069351
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601923818;
	bh=6Yl0Xg4Tejrj/m/e3kYbmMq/4zswLiJOV6OdtpFNgGk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=h/encuXKdlMj+srYy9IQecPsVr5wl3xQFA+XW+d0aRSlJmBqGxwiDSPcE3igBjw6k
	 02DY6QQbYPNZhMmWyfU8uge7UazpUkQPgQCA2tKbu3Kn6AKqEdvw6zV2oOoVQaFfPf
	 6URmMtr/l7w8CC0cWFlS7nWFWCjJVfXkFIitjDco=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095IoIjb067644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:50:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:50:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:50:18 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095IoILn013627;
	Mon, 5 Oct 2020 13:50:18 -0500
Subject: Re: [PATCH v2] prueth-fw-am65x-sr2: Updating firmware to 02.02.07.02
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201005183853.17882-1-dmurphy@ti.com>
 <20201005184444.GO7434@beryl>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <124775fa-3f59-42d2-6751-21f9a396a0e1@ti.com>
Date: Mon, 5 Oct 2020 13:50:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005184444.GO7434@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/5/20 1:44 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 05, 2020 at 01:38:53PM -0500, Dan Murphy wrote:
>> From: "Dan Murphy via Lists.Yoctoproject.Org" <dmurphy=ti.com@lists.yoctoproject.org>
> Hmm, I don't believe mailing list is supposed to mangle this part in the body,
> only the headers... E.g. the earlier patch from Praveen had this correct. You
> might want to check your local settings?

I will check and clean it up as needed.

Dan
