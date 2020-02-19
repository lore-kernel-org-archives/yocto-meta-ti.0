Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.16555.1582138855256804462
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 11:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TarjVuvt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JJ0rMI108449;
	Wed, 19 Feb 2020 13:00:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582138853;
	bh=CfVKyI932Am1FGlqnWQV7e2NLyEargg0RzBZaSkdTmU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TarjVuvtuxN09lkjVA+desjrjiKKut0UjDR7alsH4glw3c/EWEeAkgFzxibw04oH3
	 9pkgOd0lZmPKly7E88umjWhu3NcdGbAoR6seHBhaJKZ+bmuPYnlhShU6oT+iLf5dnP
	 96tOxXrYkXms7xhlpjSac8M0RjthHfOz7bhrNIJo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JJ0rXf123438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Feb 2020 13:00:53 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 13:00:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 13:00:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JJ0qNT127915;
	Wed, 19 Feb 2020 13:00:53 -0600
Date: Wed, 19 Feb 2020 14:00:52 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] am437x-evm zeus image
Message-ID: <20200219190052.GS720@beryl>
References: <8c9b4eef-4998-8859-fa66-e26f7f649223@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <8c9b4eef-4998-8859-fa66-e26f7f649223@bytesatwork.ch>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Daniel,

You are not providing any useful info, such as error messages or logs.

In general, yes, am437x-evm on Zeus is ready and has been building fine in 
many different configurations.

Denys


On Wed, Feb 19, 2020 at 11:27:55AM +0100, Daniel Ammann wrote:
> Hi all
> 
> I'm trying to build a zeus image for am437x-evm. How do I go about that? Is
> meta-ti branch zeus ready yet?
> 
> First, I tried a simple poky build with meta-openembedded and meta-ti, building
> core-image-base. But compiling of ti-sgx-ddk-km fails.
> 
> Then I followed the instructions in the arago wiki [1], but the build fails
> with qtbase because qtbase doesn't run configure successfully.
> 
> What is the recommended way to compile a development image? The goal is to compile
> a qt5 application with qtwebengine that needs eglfs support.
> 
> [1] http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> Thanks and kind regards
> 
> Daniel
