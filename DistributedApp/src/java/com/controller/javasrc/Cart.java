/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.javasrc;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THARUKA
 */
public class Cart {
    
    ArrayList<CartItem> cart_Item;

    public Cart() {
        cart_Item = new ArrayList();
    }

    public void addCartItem(CartItem newCartItem) {
        for (int x = 0; x < cart_Item.size(); x++) {
            CartItem ci = cart_Item.get(x);
            if (newCartItem.getPid() == ci.getPid()) {
                cart_Item.remove(ci);
                int qty = ci.getQty() + newCartItem.getQty();
                newCartItem.setQty(qty);
            }
        }
        cart_Item.add(newCartItem);
    }
    public List<CartItem> getMyCart() {
        return cart_Item;

    }

    public void removeProduct(CartItem ci) {
        for (int i = 0; i < cart_Item.size(); i++) {
            CartItem cartItem = cart_Item.get(i);

            if (cartItem.getPid() == ci.getPid()) {
                cart_Item.remove(cartItem);
            }

        }
    }
    
    public CartItem getProduct(int pid) {
        CartItem ci=null;
        for (int i = 0; i < cart_Item.size(); i++) {
            CartItem cartItem = cart_Item.get(i);

            if (cartItem.getPid() == pid) {
                ci=cartItem;
            }

        }
        
        return ci;
    }

}
