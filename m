Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34E7BE00BFE; Fri, 13 Jun 2014 15:34:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.54 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50F85E00C21
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
Received: by mail-pb0-f54.google.com with SMTP id jt11so2535566pbb.41
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NZksmaGHnFrw+wOyhRyb2quarMf6KejueEBwjwOtMag=;
	b=PITFooMUKpHgX/XZq9VwOU7bv70kCtAEnyjmel611ufqXH92ArDz4X2QrO9q3+CBUi
	T8ghrZogzUsOHxv8XM136xLjpm2SnLzIY1dNDLP2ilYqoWPTFgSFNb0MQllo3XfgqIXh
	D2S8Vbhm83QG/eblR1kjjWZcqRmuC9N9OdmFb5dCqyw42IWlcdTDKfh5dvgJ3NkCC0Hq
	SRc63FDDusepqav4ntx2l/FMiGd+PWtzt2sc6+AdrK9Lig9tRrYpyQtVtP8OXpw2oE13
	iB5n3EFIvwyqSKAT/YQKvP8jsv8LKX7RMuufCIR5PCZYrriUxPPGhi/4HXfpoDAhP9Oe
	tUTQ==
X-Received: by 10.68.164.67 with SMTP id yo3mr6732077pbb.104.1402698891773;
	Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.50 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:08 -0700
Message-Id: <1402698848-13759-6-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH 6/6] ti-dmai: Allow do_prepsources to run release.sh
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:56 -0000

The do_prepsources task runs after do_unpack at which point the
${S}/patches directory has been created.  In the last step of
do_prepsources, code should be copied over to ${S} by the release.sh
script.  However, this script silently fails if the target directory
(${S}) is not empty---it contains the 'patches' directory.  The
failure manifests in the do_patch step when trying to applying patches
against the source which wasn't populated by release.sh.

Here, we pre-emptively clean out the directory release.sh intends to
use.  The patch directory is re-created by the do_patch step.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 recipes-ti/dmai/ti-dmai.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 58955b5..f81b4cf 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -74,6 +74,7 @@ do_prepsources() {
     chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
     chmod a+x ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/tdox
     sed -i 's|tdox|./tdox|g' ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/release.sh
+    rm -rf ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/*
     (cd ${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface; ./release.sh ${PV})
 }
 
-- 
1.8.3.2


