Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.80.1607637050135280731
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 13:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WGmB5g+s;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BALonaw119239
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 15:50:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607637049;
	bh=rOm7Y6m1Un7OwM3E0didv2WCrgWYE+9j85/HZvA4K9A=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WGmB5g+sW2kW7lFF0tT/B9joBkTo6lUrHqYUvnZcTnzg9GRjX8SWeL40+wYi6atWV
	 c3cPyBJ1DT6aw7FKTRwTH6IIu+sKNkicsdbzyLEIibBtOWdlGa+88pd7zkgFz+2rad
	 VUUhHE5KMYwYnM0SXLaRQpq2IS3ma/dAucePBuCo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BALonM3069922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 15:50:49 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 15:50:48 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 15:50:48 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BALom1A074092;
	Thu, 10 Dec 2020 15:50:48 -0600
Subject: Re: [dunfell/master PATCH] trusted-firmware-a: Update to v2.4 merge
To: Nishanth Menon <nm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <d-gerlach@ti.com>, <s-anna@ti.com>
References: <20201210213944.31644-1-nm@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <267565a9-a6e7-5915-ac19-b1672a00e3f9@ti.com>
Date: Thu, 10 Dec 2020 15:50:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210213944.31644-1-nm@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nishanth

 From Denys

On 12/10/20 3:39 PM, Nishanth Menon wrote:
> Update to v2.4 tag merge from upstream to keep TF-A in sync.
>
> For major changes in trusted-firmware-a, See:
> https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4
>
> TI specific fixups include:
>   - stub for shutdown (CPUs enter wfi)
>   - uart console is now configurable.
>
> While at it, update to include PV as 2.4
>
> Suggested-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>   recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> index 3c1862643086..08b2e04ff711 100644
> --- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> +++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
> @@ -1,6 +1,7 @@
> +PV = "2.4"

^^^ This should be specific to a platform or SoC family.
See how all other variables below are specific to K3 with _k3 override.
Hence: PV_k3 = "2.4"

The reason is to not affect other platforms when using meta-ti in a multi-BSP
distros.


>   BRANCH_k3 = "ti-atf"
>   SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
> -SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
> +SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
>   COMPATIBLE_MACHINE_k3 = "k3"
>   TFA_BUILD_TARGET_k3 = "all"
>   TFA_INSTALL_TARGET_k3 = "bl31"
