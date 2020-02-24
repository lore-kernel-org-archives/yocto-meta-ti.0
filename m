Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.19553.1582543088570089100
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Feb 2020 03:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bTIJfZu6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nikhil.nd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OBI7cX061966;
	Mon, 24 Feb 2020 05:18:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582543087;
	bh=sCFu4Gmp+Bl0e/AtdOf51uvVzOfzHSlRS2pB7XK8MMw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=bTIJfZu6J2aJ5Axc7ekxThX2e263utk9GTV0g0VQ+2QGVZ8Mq/uQD+bVxo3XCbmd6
	 gT1u7/7IvywDX8D9Fne0HYeZ/QPXPlIqt3PUSgq+I3db9kytklJq3LJLmYuuXYiXfw
	 nS4ZK4k6e5jCnxe1OUeq1NHU9eDzYF0lHr0SwNk0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01OBI7f2095154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Feb 2020 05:18:07 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 05:18:07 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 05:18:07 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OBI5oJ098232;
	Mon, 24 Feb 2020 05:18:06 -0600
Subject: Re: [meta-ti][zeus PATCH v2] recipes-kernel: jailhose: Update to 0.12 version
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
References: <20200224105437.27936-1-nikhil.nd@ti.com>
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
Message-ID: <9ca827c7-527a-869a-f682-0f6c2784cd40@ti.com>
Date: Mon, 24 Feb 2020 16:46:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224105437.27936-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="------------090EA76CCA5117DC600D8AD5"
Content-Language: en-US

--------------090EA76CCA5117DC600D8AD5
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Build tested with latest arago-zeus-config.txt

Regards,
Nikhil D

On 24/02/20 4:24 pm, nikhil.nd@ti.com wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> Jailhouse 0.12 does not need to define custom config flags.
> Remove the steps to copy the config from do_configure task
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>
> Notes:
>      Changes from v1:
>      * Fixed build error with do_configure
>
>   recipes-kernel/jailhouse/jailhouse_git.bb | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 4186dc3a..a4ee2fc7 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
>       file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
>   "
>   
> -PV = "0.10+git${SRCPV}"
> -SRCREV = "b3a68ac89d7ed955546eae91954b184ec1583ce3"
> -BRANCH = "ti-jailhouse-0.10"
> +PV = "0.12+git${SRCPV}"
> +SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
> +BRANCH = "ti-jailhouse-0.12"
>   
>   SRC_URI = " \
>       git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
> @@ -40,9 +40,6 @@ CELL_DIR ?= "${JH_DATADIR}/cells"
>   CELLCONF_DIR ?= "${JH_DATADIR}/configs"
>   INMATES_DIR ?= "${JH_DATADIR}/inmates"
>   
> -JH_CONFIG ?= "${S}/ci/jailhouse-config-x86.h"
> -JH_CONFIG_k3 ?= "${S}/ci/jailhouse-config-k3.h"
> -
>   JH_CELL_FILES ?= "*.cell"
>   JH_CELL_FILES_k3 ?= "k3-*.cell"
>   
> @@ -69,8 +66,6 @@ do_configure() {
>   	then
>   		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
>   	fi
> -
> -	cp -av ${JH_CONFIG} ${S}/include/jailhouse/config.h
>   }
>   
>   USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \


--------------090EA76CCA5117DC600D8AD5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Build tested with latest arago-zeus-config.txt <br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <div class="moz-cite-prefix">On 24/02/20 4:24 pm, <a class="moz-txt-link-abbreviated" href="mailto:nikhil.nd@ti.com">nikhil.nd@ti.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200224105437.27936-1-nikhil.nd@ti.com">
      <pre class="moz-quote-pre" wrap="">From: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>

Jailhouse 0.12 does not need to define custom config flags.
Remove the steps to copy the config from do_configure task

Signed-off-by: Nikhil Devshatwar <a class="moz-txt-link-rfc2396E" href="mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---

Notes:
    Changes from v1:
    * Fixed build error with do_configure

 recipes-kernel/jailhouse/jailhouse_git.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 4186dc3a..a4ee2fc7 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = " \
     <a class="moz-txt-link-freetext" href="file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d">file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d</a> \
 "
 
-PV = "0.10+git${SRCPV}"
-SRCREV = "b3a68ac89d7ed955546eae91954b184ec1583ce3"
-BRANCH = "ti-jailhouse-0.10"
+PV = "0.12+git${SRCPV}"
+SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
+BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
     git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
@@ -40,9 +40,6 @@ CELL_DIR ?= "${JH_DATADIR}/cells"
 CELLCONF_DIR ?= "${JH_DATADIR}/configs"
 INMATES_DIR ?= "${JH_DATADIR}/inmates"
 
-JH_CONFIG ?= "${S}/ci/jailhouse-config-x86.h"
-JH_CONFIG_k3 ?= "${S}/ci/jailhouse-config-k3.h"
-
 JH_CELL_FILES ?= "*.cell"
 JH_CELL_FILES_k3 ?= "k3-*.cell"
 
@@ -69,8 +66,6 @@ do_configure() {
 	then
 		cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
 	fi
-
-	cp -av ${JH_CONFIG} ${S}/include/jailhouse/config.h
 }
 
 USER_SPACE_CFLAGS = '${CFLAGS} -DLIBEXECDIR=\\\"${libexecdir}\\\" \
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090EA76CCA5117DC600D8AD5--
