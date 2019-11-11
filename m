Return-Path: <ceh@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03CE7E00D59; Mon, 11 Nov 2019 11:41:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2330E00839
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 11:41:37 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xABJfbUh045022
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 13:41:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573501297;
	bh=nj83osI9okDBegw+dqxDd0f6+R/05npKkl+4XgxvOjo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=m/nt2LZJmLo8IgJrFXBINxeIcI2t7s0G+s9butSqvq9aoV1Hqb9eac4DgCwtIQRgX
	mykB5IVZVW1UovxMvuv9o13mVWLqrOhynPM3Jny/zLXuQ1L8wemClEwtppGPLOMeEe
	uXbuMdaXE5h1l4AzTghGF/kB74gY9TBMML+EzPfI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xABJfbqL076336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2019 13:41:37 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 11 Nov 2019 13:41:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 11 Nov 2019 13:41:19 -0600
Received: from [158.218.117.11] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xABJfa31069217;
	Mon, 11 Nov 2019 13:41:36 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1573499252-44324-1-git-send-email-denys@ti.com>
From: Carlos Hernandez <ceh@ti.com>
Message-ID: <77dd31ad-cde6-3fec-b723-d48e279e393a@ti.com>
Date: Mon, 11 Nov 2019 14:41:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1573499252-44324-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [thud/master][PATCH] am65xx-evm: add k3-am654-evm-prupwm.dtbo
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2019 19:41:39 -0000
Content-Type: multipart/alternative;
	boundary="------------8E5667D3AE37323E54FBB605"
Content-Language: en-US

--------------8E5667D3AE37323E54FBB605
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/11/19 2:07 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   conf/machine/am65xx-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
> index cc15d73..82959ce 100644
> --- a/conf/machine/am65xx-evm.conf
> +++ b/conf/machine/am65xx-evm.conf
> @@ -18,6 +18,7 @@ KERNEL_DEVICETREE = " \
>       ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
>       ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
>       ti/k3-am654-base-board-jailhouse.dtbo \
> +    ti/k3-am654-evm-prupwm.dtbo \
>   "
>   
>   UBOOT_MACHINE = "am65x_evm_a53_defconfig"

Acked-by: Carlos Hernandez <ceh@ti.com>

-- 
Carlos


--------------8E5667D3AE37323E54FBB605
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/11/19 2:07 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1573499252-44324-1-git-send-email-denys@ti.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 conf/machine/am65xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index cc15d73..82959ce 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
     ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-base-board-jailhouse.dtbo \
+    ti/k3-am654-evm-prupwm.dtbo \
 "
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap="">Acked-by: Carlos Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:ceh@ti.com">&lt;ceh@ti.com&gt;</a>

</pre>
    <blockquote type="cite"
      cite="mid:1573499252-44324-1-git-send-email-denys@ti.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Carlos</pre>
  </body>
</html>

--------------8E5667D3AE37323E54FBB605--
