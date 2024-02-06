Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75302C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:15:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.23713.1707232547474256414
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=YmtSlJWb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 416FFfQl066038;
	Tue, 6 Feb 2024 09:15:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707232541;
	bh=ahTUOEeriHp5YjJ2j1tZ9wdqF+Djv0+iZ1U7LqZT4Mw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YmtSlJWbux3DL5l3QaOcXChFuwzNYkyr7HglAjf43o2GaIMafB5ghN4enNRYx41qy
	 JJ4iZC72S1LCCMpuAwBVMwb/1yGnlwxFZtAej8HuMNtO0TH/+NBQwQG9j7HpqQlo/H
	 vNPweB3zefEA/8waJcVY/eriJDxwpa8CKZuGstEo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 416FFfLe004388
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Feb 2024 09:15:41 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Feb 2024 09:15:40 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Feb 2024 09:15:41 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 416FFeun071534;
	Tue, 6 Feb 2024 09:15:40 -0600
Message-ID: <4576ec9f-8566-4bb4-9510-e23eca4ec6d5@ti.com>
Date: Tue, 6 Feb 2024 09:15:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] check-layer failures for meta-ti
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <alexandre.belloni@bootlin.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <202402060743225a1d9587@mail.local>
 <20240206081744.GF15614@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240206081744.GF15614@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:15:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17449



On 2/6/2024 2:17 AM, Denys Dmytriyenko wrote:
> On Tue, Feb 06, 2024 at 08:43:22AM +0100, Alexandre Belloni via lists.yoctoproject.org wrote:
>> Hello,
>>
>> meta-ti is currently failing check-layer-nightly:
>>
>> AssertionError: Adding layer meta-ti-extras changed signatures.
>> 19 signatures changed, initial differences (first hash before, second after):
>>     python3-yamllint:do_recipe_qa: fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 -> 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
>>        bitbake-diffsigs --task python3-yamllint do_recipe_qa --signature fc237fe111fe2f670fa77ee058d87ca7d6504dbd79e67473d6a4b7446b663ee8 1cd40e42be630dbb89ee6b685d818c0010544cf11bc9207f3ba26ab922389f4e
>>        NOTE: Starting bitbake server...
>>        basehash changed from 1bc327910b55333ec708cf071f99c3bc4beb62595f125f6206833bf24f4a7052 to 5f4d001ca8ce422815b6bc9c4c584b8712a5cc6b766ca1cbd28af4269be5ab6a
>>        Variable ERROR_QA value changed:
>>        @@ -1,2 +1,2 @@
>>        -dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)} patch-status
>>        +dev-so debug-deps dev-deps debug-files arch pkgconfig la             perms dep-cmp pkgvarcheck perm-config perm-line perm-link             split-strip packages-list pkgv-undefined var-undefined             version-going-backwards expanded-d invalid-chars             license-checksum dev-elf file-rdeps configure-unsafe             configure-gettext perllocalpod shebang-size             already-stripped installed-vs-shipped ldflags compile-host-path             install-host-path pn-overrides unknown-configure-option             useless-rpaths rpaths staticdev empty-dirs             patch-fuzz             ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}
>>         DISTRO_FEATURES{usrmerge} = Unset
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1882/steps/20/logs/stdio
> 
> The fix is already in master-next:
> https://git.yoctoproject.org/meta-ti/commit/?h=master-next&id=af4bfac806c22166cf77f93b2a33dd984f03293d
> 
> Not sure if there are any issues merging this to master... Ryan?

Nope.  I'll get it pushed out today.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

