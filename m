Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96BCEE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 12:02:28 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LY90066AOZEQQ10@vms173015.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 23 Jan 2012 14:02:12 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E1E2920333; Mon,
	23 Jan 2012 15:02:01 -0500 (EST)
Date: Mon, 23 Jan 2012 15:02:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120123200201.GK17838@denix.org>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
	<1327328309-15956-6-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1327328309-15956-6-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 5/7] libgles-omap3: adjust packaging for all windowing systems to remove the magic esrev file
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2012 20:02:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 23, 2012 at 03:18:27PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-graphics/libgles/libgles-omap3.inc |   29 ++++++++++++++++++++++++++-
>  1 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> index 289b7d5..722ac13 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
>  # 'TSPA.txt' might not be the best file to md5sum
>  LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
>  
> -PR = "r21"
> +PR = "r22"
>  
>  COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
>  
> @@ -325,6 +325,7 @@ INSANE_SKIP_${PN}-flipwsegl = "ldflags"
>  INSANE_SKIP_${PN}-frontwsegl = "ldflags"
>  INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
>  INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
> +INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"

While we can argue this entire patch can be squashed with #3, the above line 
definitely belongs to #3, when split this way...

-- 
Denys


>  INSANE_SKIP_${PN}-tests = "ldflags"
>  INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
>  
> @@ -339,8 +340,32 @@ INITSCRIPT_PARAMS = "start 30 5 2 . stop 40 0 1 6 ."
>  
>  # Append to update-rc.d postinst
>  pkg_postinst_${PN}_append() {
> -rm -f /etc/powervr-esrev
> +rm -f ${sysconfdir}/powervr-esrev
>  
>  ln -sf /usr/lib/libXdmcp.so.6.0.0 /usr/lib/libXdmcp.so.0 
>  ln -sf /usr/lib/libXau.so.6.0.0 /usr/lib/libXau.so.0
>  }
> +
> +pkg_postinst_${PN}-blitwsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +
> +pkg_postinst_${PN}-flipwsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +
> +pkg_postinst_${PN}-frontwsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +pkg_postinst_${PN}-linuxfbwsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +
> +pkg_postinst_${PN}-x11wsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +
> +pkg_postinst_${PN}-driwsegl() {
> +rm -f ${sysconfdir}/powervr-esrev
> +}
> +
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

