Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0016E00A9B; Wed, 20 Sep 2017 12:55:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F0EBE00970
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 12:55:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KJsxVR013780
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 14:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505937299;
	bh=iS+CY4rWcKr96KfA5MVZcFiN/GeePuZrVWXaWBkNb7w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nbC8m7F6fuAKRnYorjYlUTzOoU6xBgMDzpI5u3Q6jr42B/oDVY+yJgDU5jvXpkWWq
	U8NcfMLloHr8ytLAyIc8ge6L5E9XN2Tf6uIaYmKl4tCiu1/RWclWh2wzpU4GwaCRk7
	aO8X6LpTc8GNvaQXu/tQYXi/JyCjPUD2mue9fPuA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJsxRM024171
	for <meta-ti@yoctoproject.org>; Wed, 20 Sep 2017 14:54:59 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 14:54:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 14:54:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KJsx5n030826;
	Wed, 20 Sep 2017 14:54:59 -0500
Date: Wed, 20 Sep 2017 15:54:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170920195443.GY26843@edge>
References: <1505921850-10668-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1505921850-10668-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] component-meta: Adding component meta information
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
X-List-Received-Date: Wed, 20 Sep 2017 19:55:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK, this has been discussed in the past...


On Wed, Sep 20, 2017 at 11:37:30AM -0400, Mahesh Radhakrishnan wrote:
> Class for adding component meta information
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  classes/component_meta.bbclass | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 classes/component_meta.bbclass
> 
> diff --git a/classes/component_meta.bbclass b/classes/component_meta.bbclass
> new file mode 100644
> index 0000000..f2dc754
> --- /dev/null
> +++ b/classes/component_meta.bbclass
> @@ -0,0 +1,29 @@
> +CM_NAME ?= ""
> +CM_VERSION ?= ""
> +CM_ROOT_DIR ?= ""
> +CM_BINARY ?= ""
> +CM_DESCRIPTION ?= ""
> +
> +do_component_meta() {
> +    if [ ! -d "${DEPLOY_DIR_IMAGE}" ]
> +    then
> +        mkdir -p ${DEPLOY_DIR_IMAGE}    
> +    fi
> +
> +    if [ ! -e "${DEPLOY_DIR_IMAGE}/.components_meta" ]
> +    then
> +        touch ${DEPLOY_DIR_IMAGE}/.components_meta
> +    fi
> +
> +    # Check if component is already documented in .components_meta
> +    if ! grep -q "${CM_ROOT_DIR}" ${DEPLOY_DIR_IMAGE}/.components_meta
> +    then
> +        # Add component meta information
> +        echo "${CM_NAME}|${CM_VERSION}|${CM_ROOT_DIR}|${CM_BINARY}|${CM_DESCRIPTION}" >> \
> +            ${DEPLOY_DIR_IMAGE}/.components_meta
> +    fi
> +}
> +
> +do_component_meta[lockfiles] = "${DEPLOY_DIR_IMAGE}/component_meta.lock"
> +
> +addtask do_component_meta after do_install before do_package
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

