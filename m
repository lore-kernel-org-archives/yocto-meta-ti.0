Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6BD5E00839; Fri, 24 Feb 2017 18:01:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD7FCE00546
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 18:01:51 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1P21eFh003856
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 20:01:40 -0600
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P21Yv0032167
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 20:01:35 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1P21Wtt004679
	for <meta-ti@yoctoproject.org>; Sat, 25 Feb 2017 07:31:33 +0530
Received: from [172.22.217.45] (172.22.217.45) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 25 Feb 2017 07:31:31 +0530
To: <meta-ti@yoctoproject.org>
References: <1487934242-3848-1-git-send-email-anandb@ti.com>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58B0E57B.90007@ti.com>
Date: Sat, 25 Feb 2017 07:31:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1487934242-3848-1-git-send-email-anandb@ti.com>
X-Originating-IP: [172.22.217.45]
Subject: Re: [PATCH 1/1] ti-sgx-ddk-um: add support for dmabuf import in GBM WSEGL
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
X-List-Received-Date: Sat, 25 Feb 2017 02:01:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This is required for both master and krogoth

On 24-Feb-17 4:34 PM, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>   recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> index acbbe3e..f90d689 100644
> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>   BRANCH = "ti-img-sgx/${PV}"
>   
>   SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "d1cb4ea42dbf275e2013aae95ad2d9182f05648c"
> +SRCREV = "e8fda0a1865e206c058776b15336a53edc5e5999"
>   
>   # There's only hardfp version available
>   python __anonymous() {
> @@ -31,7 +31,7 @@ INITSCRIPT_PARAMS = "defaults 8"
>   
>   inherit update-rc.d
>   
> -PR = "r21"
> +PR = "r22"
>   PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
>   
>   DEPENDS += "libdrm udev libgbm wayland libffi"


