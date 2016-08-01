Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 922FEE010EC; Mon,  1 Aug 2016 16:34:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF855E010EC
	for <meta-ti@yoctoproject.org>; Mon,  1 Aug 2016 16:34:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u71NUvkr016682;
	Mon, 1 Aug 2016 18:30:57 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71NYopE019890;
	Mon, 1 Aug 2016 18:34:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 Aug 2016 18:34:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u71NYnv3012240;
	Mon, 1 Aug 2016 18:34:50 -0500
Date: Mon, 1 Aug 2016 19:34:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <20160801233449.GI3677@edge>
References: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <b1415311-95cc-b627-23f0-8de950e8d1a4@xilinx.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting started with meta-ti (beaglebone)
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
X-List-Received-Date: Mon, 01 Aug 2016 23:34:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 01, 2016 at 03:49:37PM -0700, Manjukumar Harthikote Matha wrote:
> All,
> 
> I am trying to build for beaglebone but facing some errors on master
> branch. Maybe I am missing some configuration for the builds, can
> you please help me out
> 
> I cloned, poky, meta-openembedded and meta-ti master branch
> 
> source oe-init-build-env beaglebone
> 
> Added BBMASK = "meta-ti/recipes-misc" in local.conf

What's this ^^^ for?


> MACHINE=beaglebone bitbake core-image-minimal
> 
> Gives me an error

Are those Python3 related errors?


> ERROR: Unable to parse /workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> Traceback (most recent call last):
>   File
> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py",
> line 151, in SignatureGeneratorOEBasicHash.finalise(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb',
> d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>, variant=None):
>              try:
>     >            taskdeps = self._build_data(fn, d)
>              except:
>   File
> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/siggen.py",
> line 104, in SignatureGeneratorOEBasicHash._build_data(fn='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/ti-cgt6x_6.1.20.bb',
> d=<bb.data_smart.DataSmart object at 0x7fd9cd6f1b38>):
> 
>     >        tasklist, gendeps, lookupcache =
> bb.data.generate_dependencies(d)
> 
>   File
> "/workspaces/manjukum/meta-ti-build/poky/bitbake/lib/bb/data.py",
> line 438, in generate_dependencies(d=<bb.data_smart.DataSmart object
> at 0x7fd9cd6f1b38>):
>                      if dep not in deps:
>     >                    deps[dep], values[dep] =
> build_dependencies(dep, keys, shelldeps, varflagsexcl, d)
>                      newdeps |=  deps[dep]
> 
> ....
> ....
> ='/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc'):
>              code = compile(check_indent(str(node)), filename, "exec",
>     >                       ast.PyCF_ONLY_AST)
> 
>   File "/workspaces/manjukum/meta-ti-build/poky/meta-ti/recipes-ti/devtools/../includes/../includes/ti-unpack.inc",
> line 51
>     os.chmod(binfile, 0755)
>                          ^
> SyntaxError: invalid token
> 
> 
> Any help is appreciated.
> 
> Thanks
> Manju
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

