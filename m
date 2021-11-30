Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.79794.1638294802668492954
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dvudgSdk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AUHrE7Q100885;
	Tue, 30 Nov 2021 11:53:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638294794;
	bh=A9U0N2BlljGHjxsSO8V59Pw7/ldufrIrjeXA3SM81a0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dvudgSdk/rYGoWRJpTMFnEE+arLlh687AgtJ3IFRS6/AzyJIh+10q8hJl+Vpsk8gD
	 /4jZO1XHZrx9sVkh3yN2t8c4DMqZcrrfGvzhCSLAr4AldXg34D2+o3AXoSuRLl+2Aq
	 BsXQa4ejoX0Vh0nMPZgNTmll48LolmP/3ShwmCrU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AUHrELv099820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Nov 2021 11:53:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 30
 Nov 2021 11:53:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 30 Nov 2021 11:53:13 -0600
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AUHrD4g027861;
	Tue, 30 Nov 2021 11:53:13 -0600
Message-ID: <6ae97914-a71a-35f4-7f26-a0d43b56e3f9@ti.com>
Date: Tue, 30 Nov 2021 11:53:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [dunfell/master][PATCH] viddec-test-app: Add the viddec-test-app recipe
To: <sidraya.bj@pathpartnertech.com>, <meta-ti@lists.yoctoproject.org>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: <yogeshs@ti.com>, <d-huang@ti.com>, <prashanth.ka@pathpartnertech.com>,
        <praveen.ap@pathpartnertech.com>,
        Angela Stegmaier <angelabaker@ti.com>
References: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211130174301.906-1-sidraya.bj@pathpartnertech.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/30/2021 11:43 AM, sidraya.bj@pathpartnertech.com wrote:
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> The viddec-test-app provides the video decoder test app
> (tidec_decode) for j7-evm.
> 
> Signed-off-by: David Huang <d-huang@ti.com>
> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Please use Denys Dmytriyenko <denis@denix.org> instead


> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>   .../viddec-test-app_1.0.0.bb                   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> new file mode 100644
> index 00000000..48a17537
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=f17e17d664f72942124e4fcf06c178ee"
> +
> +DEPENDS = "libdrm ffmpeg"
> +
> +inherit autotools pkgconfig
> +
> +PR = "r1"
> +SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/viddec-test-app.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> 
