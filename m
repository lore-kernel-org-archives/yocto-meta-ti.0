Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C389E007C2; Tue, 12 Aug 2014 19:57:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC86AE0079A
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 19:57:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NA800L6E5JZZR80@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Aug 2014 21:57:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2C9DE2016D; Tue,
	12 Aug 2014 22:57:35 -0400 (EDT)
Date: Tue, 12 Aug 2014 22:57:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Dmytriyenko, Denys" <denys@ti.com>
Message-id: <20140813025735.GF2480@denix.org>
References: <1407891625-23383-1-git-send-email-aymeric.dumaz@gmail.com>
	<B0581B5571079145BA1CD78C126DBDE7320BC154@DLEE08.ent.ti.com>
MIME-version: 1.0
In-reply-to: <B0581B5571079145BA1CD78C126DBDE7320BC154@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy/master][PATCH] recipes-qt: add a .bbappend for	qtbase
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
X-List-Received-Date: Wed, 13 Aug 2014 02:57:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Aug 13, 2014 at 02:37:54AM +0000, Dmytriyenko, Denys wrote:
> NAK. This does not belong in meta-ti. We have most of that already in meta-arago though.
> 
> 
> Sent from my Android phone using TouchDown (www.nitrodesk.com)
> 
> -----Original Message-----
> From: Aymeric Dumaz [aymeric.dumaz@gmail.com]
> Received: Tuesday, 12 Aug 2014, 21:01
> To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> Subject: [meta-ti] [daisy/master][PATCH] recipes-qt: add a .bbappend for qtbase
> 
> This bbappend is inspired from the meta-fsl-arm one [1].
> It is made to build qtbase with ligles-omap3 libraries and integrate more
> plugins, like tslib.
> 
> It has only been tested on AM335x EVM-SK, hence the _ti33x overrides; the
> QMAKE_LIBS flags come from [2] and [3].

Moreover, you don't need to mangle QMAKE_LIBS for SGX - those references are 
now too old...


> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/qt5-layer/recipes-qt/qt5/
> [2] https://github.com/prabindh/sgxconfiguro/tree/master/pkgconfig/5.xx
> [3] https://github.com/prabindh/qt-configs/tree/master/qt5_1_1_Sep13
> 
> Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
> ---
>  recipes-qt/qt5/qtbase_%.bbappend | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtbase_%.bbappend
> 
> diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
> new file mode 100644
> index 0000000..eaa4a6b
> --- /dev/null
> +++ b/recipes-qt/qt5/qtbase_%.bbappend
> @@ -0,0 +1,15 @@
> +PACKAGECONFIG_GL_ti33x = "gles2"
> +PACKAGECONFIG_append_ti33x = " tslib icu examples"
> +
> +do_configure_prepend_ti33x() {
> +    sed -i 's!load(qt_config)!!' ${S}/mkspecs/linux-oe-g++/qmake.conf
> +
> +    cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
> +
> +QMAKE_LIBS_EGL         += -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
> +QMAKE_LIBS_OPENGL_ES2  += -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
> +
> +load(qt_config)
> +
> +EOF
> +}
> --
> 1.9.1
> 
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


